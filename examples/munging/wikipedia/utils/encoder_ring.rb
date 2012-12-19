module Wikipedia

  WP_URI_ENCODER = {
    "\x00"=>"%00", "\x01"=>"%01", "\x02"=>"%02", "\x03"=>"%03", "\x04"=>"%04", "\x05"=>"%05", "\x06"=>"%06", "\a"  =>"%07", "\b"  =>"%08", "\t"  =>"%09", "\n"  =>"%0A", "\v"  =>"%0B", "\f"  =>"%0C", "\r"  =>"%0D", "\x0E"=>"%0E", "\x0F"=>"%0F",
    "\x10"=>"%10", "\x11"=>"%11", "\x12"=>"%12", "\x13"=>"%13", "\x14"=>"%14", "\x15"=>"%15", "\x16"=>"%16", "\x17"=>"%17", "\x18"=>"%18", "\x19"=>"%19", "\x1A"=>"%1A", "\e"  =>"%1B", "\x1C"=>"%1C", "\x1D"=>"%1D", "\x1E"=>"%1E", "\x1F"=>"%1F",
    " "  => "_",   "!"  => "%21", "\"" => "%22", "#"  => "%23", "$"  => "%24", "%"  => "%25", "&"  => "%26", "'"  => "%27", "("  => "%28", ")"  => "%29", "*"  => "%2A", "+"  => "%2B", ","  => "%2C", "-"  => "%2D", "."  => "%2E", "/"  => "%2F",
    "0"  => "%30", "1"  => "%31", "2"  => "%32", "3"  => "%33", "4"  => "%34", "5"  => "%35", "6"  => "%36", "7"  => "%37", "8"  => "%38", "9"  => "%39", ":"  => "%3A", ";"  => "%3B", "<"  => "%3C", "="  => "%3D", ">"  => "%3E", "?"  => "%3F",
    "@"  => "%40", "A"  => "%41", "B"  => "%42", "C"  => "%43", "D"  => "%44", "E"  => "%45", "F"  => "%46", "G"  => "%47", "H"  => "%48", "I"  => "%49", "J"  => "%4A", "K"  => "%4B", "L"  => "%4C", "M"  => "%4D", "N"  => "%4E", "O"  => "%4F",
    "P"  => "%50", "Q"  => "%51", "R"  => "%52", "S"  => "%53", "T"  => "%54", "U"  => "%55", "V"  => "%56", "W"  => "%57", "X"  => "%58", "Y"  => "%59", "Z"  => "%5A", "["  => "%5B", "\\" => "%5C", "]"  => "%5D", "^"  => "%5E", "_"  => "%5F",
    "`"  => "%60", "a"  => "%61", "b"  => "%62", "c"  => "%63", "d"  => "%64", "e"  => "%65", "f"  => "%66", "g"  => "%67", "h"  => "%68", "i"  => "%69", "j"  => "%6A", "k"  => "%6B", "l"  => "%6C", "m"  => "%6D", "n"  => "%6E", "o"  => "%6F",
    "p"  => "%70", "q"  => "%71", "r"  => "%72", "s"  => "%73", "t"  => "%74", "u"  => "%75", "v"  => "%76", "w"  => "%77", "x"  => "%78", "y"  => "%79", "z"  => "%7A", "{"  => "%7B", "|"  => "%7C", "}"  => "%7D", "~"  => "%7E", "\x7F"=>"%7F",
    "\x80"=>"%80", "\x81"=>"%81", "\x82"=>"%82", "\x83"=>"%83", "\x84"=>"%84", "\x85"=>"%85", "\x86"=>"%86", "\x87"=>"%87", "\x88"=>"%88", "\x89"=>"%89", "\x8A"=>"%8A", "\x8B"=>"%8B", "\x8C"=>"%8C", "\x8D"=>"%8D", "\x8E"=>"%8E", "\x8F"=>"%8F",
    "\x90"=>"%90", "\x91"=>"%91", "\x92"=>"%92", "\x93"=>"%93", "\x94"=>"%94", "\x95"=>"%95", "\x96"=>"%96", "\x97"=>"%97", "\x98"=>"%98", "\x99"=>"%99", "\x9A"=>"%9A", "\x9B"=>"%9B", "\x9C"=>"%9C", "\x9D"=>"%9D", "\x9E"=>"%9E", "\x9F"=>"%9F",
    "\xA0"=>"%A0", "\xA1"=>"%A1", "\xA2"=>"%A2", "\xA3"=>"%A3", "\xA4"=>"%A4", "\xA5"=>"%A5", "\xA6"=>"%A6", "\xA7"=>"%A7", "\xA8"=>"%A8", "\xA9"=>"%A9", "\xAA"=>"%AA", "\xAB"=>"%AB", "\xAC"=>"%AC", "\xAD"=>"%AD", "\xAE"=>"%AE", "\xAF"=>"%AF",
    "\xB0"=>"%B0", "\xB1"=>"%B1", "\xB2"=>"%B2", "\xB3"=>"%B3", "\xB4"=>"%B4", "\xB5"=>"%B5", "\xB6"=>"%B6", "\xB7"=>"%B7", "\xB8"=>"%B8", "\xB9"=>"%B9", "\xBA"=>"%BA", "\xBB"=>"%BB", "\xBC"=>"%BC", "\xBD"=>"%BD", "\xBE"=>"%BE", "\xBF"=>"%BF",
    "\xC0"=>"%C0", "\xC1"=>"%C1", "\xC2"=>"%C2", "\xC3"=>"%C3", "\xC4"=>"%C4", "\xC5"=>"%C5", "\xC6"=>"%C6", "\xC7"=>"%C7", "\xC8"=>"%C8", "\xC9"=>"%C9", "\xCA"=>"%CA", "\xCB"=>"%CB", "\xCC"=>"%CC", "\xCD"=>"%CD", "\xCE"=>"%CE", "\xCF"=>"%CF",
    "\xD0"=>"%D0", "\xD1"=>"%D1", "\xD2"=>"%D2", "\xD3"=>"%D3", "\xD4"=>"%D4", "\xD5"=>"%D5", "\xD6"=>"%D6", "\xD7"=>"%D7", "\xD8"=>"%D8", "\xD9"=>"%D9", "\xDA"=>"%DA", "\xDB"=>"%DB", "\xDC"=>"%DC", "\xDD"=>"%DD", "\xDE"=>"%DE", "\xDF"=>"%DF",
    "\xE0"=>"%E0", "\xE1"=>"%E1", "\xE2"=>"%E2", "\xE3"=>"%E3", "\xE4"=>"%E4", "\xE5"=>"%E5", "\xE6"=>"%E6", "\xE7"=>"%E7", "\xE8"=>"%E8", "\xE9"=>"%E9", "\xEA"=>"%EA", "\xEB"=>"%EB", "\xEC"=>"%EC", "\xED"=>"%ED", "\xEE"=>"%EE", "\xEF"=>"%EF",
    "\xF0"=>"%F0", "\xF1"=>"%F1", "\xF2"=>"%F2", "\xF3"=>"%F3", "\xF4"=>"%F4", "\xF5"=>"%F5", "\xF6"=>"%F6", "\xF7"=>"%F7", "\xF8"=>"%F8", "\xF9"=>"%F9", "\xFA"=>"%FA", "\xFB"=>"%FB", "\xFC"=>"%FC", "\xFD"=>"%FD", "\xFE"=>"%FE", "\xFF"=>"%FF"
  }

  def self.title_to_wikipedia_id(str)
    str = str.dup
    str.force_encoding(Encoding::ASCII_8BIT)
    str.gsub!(/[^*\-\.0-9A-Z_a-z\;\/\:\@\&\=\+\$\,\(\)\'\!\~]/, WP_URI_ENCODER)
    str.force_encoding(Encoding::US_ASCII)
  end

  def self.title_to_wikipedia_slug(str)
    str.
      gsub(%r{\\\"}, '"').
      gsub(/[ \?\`\"%^]/, WP_URI_ENCODER).
      gsub(%r{\\\\}, '%5C')
  end

end