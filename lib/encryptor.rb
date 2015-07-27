require './lib/offset'
class Encryptor
	attr_accessor :message, :offset
	def initialize(message = "..end..")
		@message = message
		@offset = Offset.new
	end

	def alphabet
		("a".."z").to_a
	end

	def numbers
		("1".."9").to_a
	end

	def char_map
		[alphabet, numbers, " ", ",", "."].flatten
	end

	def rotate_char_map(number)
		char_map.rotate(number)
	end

	def encrypt
		scanned_message
	end

	def scanned_message
			message.scan(/.{1,4}/)
	end
end