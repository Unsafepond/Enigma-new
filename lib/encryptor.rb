require './lib/offset'
require './lib/keygen'
class Encryptor
	attr_accessor :message, :offset, :key, :a_key,
	:b_key, :c_key, :d_key, :a_rotated, :b_rotated, :c_rotated,
	:d_rotated, :a_hash, :b_hash, :c_hash, :d_hash

	def initialize(message = "..end..", key = Keygen.new.generate, offset = DateOffset.new.offset)
		@message = message
		@offset = offset
		@key = key
		@a_key = offset[0].to_i + key[0..1].to_i
		@b_key = offset[1].to_i + key[1..2].to_i
		@c_key = offset[2].to_i + key[2..3].to_i
		@d_key = offset[3].to_i + key[3..4].to_i
		@a_rotated = rotate_char_map(a_key)
		@b_rotated = rotate_char_map(b_key)
		@c_rotated = rotate_char_map(c_key)
		@d_rotated = rotate_char_map(d_key)
		@a_hash = hash_char_map(a_rotated)
		@b_hash = hash_char_map(b_rotated)
		@c_hash = hash_char_map(c_rotated)
		@d_hash = hash_char_map(d_rotated)

	end

	def alphabet
		("a".."z").to_a
	end

	def numbers
		("0".."9").to_a
	end

	def char_map
		[alphabet, numbers, " ", ",", "."].flatten
	end

	def rotate_char_map(number)
		char_map.rotate(number)
	end

	def hash_char_map(value)
		Hash[char_map.zip(value)]
	end

	def encrypt
		encrypted = []
		 scanned_message.each do |segment|
			encrypted << a_hash[segment[0]]
			encrypted << b_hash[segment[1]]
			encrypted << c_hash[segment[2]]
			encrypted << d_hash[segment[3]]
		end
	puts encrypted.join
	end

	def scanned_message
			message.scan(/.{1,4}/)
	end
end

