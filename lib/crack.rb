require './lib/encryptor'

class Crack
	attr_accessor :encrypted, :char_map
	def initialize(encrypted = "ln2cpnx", date = "290715")
		@encrypted = encrypted
		@date = date
		@char_map = Encryptor.new.char_map
	end

	def decrypt_crack

		basic_rotation = get_basic_rotation(last_complete_pair)
		puts "basic_rotation:", basic_rotation
	end

	def scan_message
		encrypted.scan(/.{1,4}/)
	end

	def last_complete_pair
		scanned_message = scan_message
		end_message = "..end..".split("")
		if scanned_message[-1].size == 4
			last_complete_block = scanned_message[-1]
		else
			last_complete_block = scanned_message[-2]
			last_block_size = scanned_message[-1].size
			end_message = end_message[0...-(last_block_size)]
		end
		last_complete_block_end_msg_mapped = end_message[-4..-1]
		[last_complete_block_end_msg_mapped, last_complete_block]
	end

	def get_basic_rotation(last_complete_pair)
		last_complete_block_end_msg_mapped = last_complete_pair[0]
		last_complete_block = last_complete_pair[1]
		block_index = 0
		last_complete_block_end_msg_mapped.inject([]) do |r, e|
			counter = 0
			e_index = char_map.index(e)
			while char_map[(e_index + counter)] != last_complete_block[block_index]
				char_map.rotate(1)
				counter += 1
			end
			block_index += 1
			r << counter
		end

	end
end
