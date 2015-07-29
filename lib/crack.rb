require './lib/encryptor'

class Crack
	attr_accessor :encrypted
	def initialize(encrypted = "ln2cpnx")
		@encrypted = encrypted
	end

	def scan_message
		encrypted.scan(/.{1,4}/)
	end

	def last_8_characters
		scan_message.last(2)
	end

end