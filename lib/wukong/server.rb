module Wukong
  module EventMachineServer
    include DriverMethods

    def self.included klass
      klass.class_eval do
        attr_accessor :dataflow, :settings  

        def self.add_signal_traps
          Signal.trap('INT')  { log.info 'Received SIGINT. Stopping.'  ; EM.stop }
          Signal.trap('TERM') { log.info 'Received SIGTERM. Stopping.' ; EM.stop }                  
        end
      end
    end

    def initialize(label, settings)
      super
      @settings = settings      
      @dataflow = construct_dataflow(label, settings)
    end
      
  end

  class StdioServer < EM::P::LineAndTextProtocol
    include EventMachineServer
    include Processor::StdoutProcessor
    include Logging
    
    def self.start(label, settings = {})
      EM.attach($stdin, self, label, settings)
    end

    def post_init      
      self.class.add_signal_traps
      setup_dataflow
    end

    def receive_line line
      driver.send_through_dataflow(line)
    end

    def unbind
      finalize_and_stop_dataflow
      EM.stop
    end
    
  end

  class TCPServer < EM::P::LineAndTextProtocol
    include EventMachineServer
    include Processor::BufferedProcessor
    include Logging
       
    def self.start(label, settings = {})
      host = settings[:host] || Socket.gethostname
      port = settings[:port] || 9000
      EM.start_server(host, port, self, label, settings)
      log.info "Server started on #{host} on port #{port}"
      add_signal_traps
    end

    def post_init
      port, ip = Socket.unpack_sockaddr_in(get_peername)
      log.info "Connected to #{ip} on #{port}"
      setup_dataflow
    end

    def receive_line line
      @buffer = []      
      operation = proc { driver.send_through_dataflow(line) }
      callback  = proc { flush_buffer @buffer }
      EM.defer(operation, callback)
    end

    def flush_buffer records
      send_data(records.join("\n") + "\n")
      records.clear
    end

    def unbind
      EM.stop
    end
    
  end
end

class StupidServer

  attr_accessor :dataflow, :settings
  
  def initialize(label, settings)
    @settings = settings
    builder   = Wukong.registry.retrieve(label.to_sym)
    dataflow  = builder.build(settings)
    @dataflow = dataflow.respond_to?(:stages) ? dataflow.directed_sort.map{ |name| dataflow.stages[name] } : [ dataflow ]
    @dataflow << self
  end

  def dumb_driver
    @dumb_driver ||= Wukong::Driver.new(dataflow)
  end

  def stop() ; end
  def setup() ; end
  def process(record) $stdout.puts record ; end

  def run!
    dataflow.each(&:setup)

    while line = $stdin.readline.chomp rescue nil do
      dumb_driver.send_through_dataflow(line)
    end
    dataflow.each do |stage|
      stage.finalize(&dumb_driver.advance(stage)) if stage.respond_to?(:finalize)
      stage.stop
    end      

  end  
end
