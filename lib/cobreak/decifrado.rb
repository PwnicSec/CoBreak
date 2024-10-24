require 'ascii85'

module CoBreak
  class Decifrado
    def self.cipher(mode, dato)
      decipher = OpenStruct.new
      decipher.mode = mode
      decipher.dato = dato
      if (decipher.mode.eql?('base16'))
        decipher.result = CoBreak::Cipher::Base16.decode(decipher.dato)
      elsif (decipher.mode.eql?('base32'))
        decipher.result = CoBreak::Cipher::Base32.decode(decipher.dato)
      elsif (decipher.mode.eql?('base64'))
        decipher.result = CoBreak::Base64.decode(decipher.dato)
      elsif (decipher.mode.eql?('ascii85'))
        decipher.result = CoBreak::Ascii85.decode(decipher.dato)
      elsif (decipher.mode.eql?('cesar'))
        decipher.result = CoBreak::Cesar.decode(decipher.dato, ARGV[0].to_i)
      elsif (decipher.mode.eql?('binary'))
        decipher.result = CoBreak::Binary.decode(decipher.dato)
      end
      unless (decipher.result.nil?) or (decipher.result.eql?(decipher.dato))
        puts "\n\e[1;32m[\e[37m+\e[1;32m]\e[37m DecipherText: #{decipher.result}"
        if (decipher.mode.eql?('cesar'))
          puts "\e[1;32m[\e[37m+\e[1;32m]\e[37m Number Rotations: #{ARGV[0]}"
        end
      else
        puts "\e[1;31m[\e[37m+\e[1;31m]\e[37m Not Cipher Text..."
      end
    end
  end
end
