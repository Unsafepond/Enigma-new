require 'minitest/autorun'
require 'minitest/pride'
require './lib/decryptor'

class TestDecryptor < Minitest::Test
	def test_its_a_thing
		en = Decryptor.new

		assert en
	end

	def test_it_gets_a_message
		en = Decryptor.new("abc..end..")

		assert_equal "abc..end..", en.message
	end

	def test_it_scans_message_divisible_by_4
		en = Decryptor.new("a..end..")

		assert_equal ["a..e", "nd.."], en.scanned_message
	end

	def test_it_scans_message
		en = Decryptor.new("abc..end..")

		assert_equal ["abc.", ".end", ".."], en.scanned_message
	end

	def test_alphabet
		en = Decryptor.new

		assert_equal ["a", "b", "c"], en.alphabet[0..2]
	end

	def test_numbers
		en = Decryptor.new

		assert_equal ["0", "1", "2"], en.numbers[0..2]
	end

	def test_char_map
		en = Decryptor.new

		assert_equal ["6", "7", "8", "9"], en.char_map[32..35]
	end

	def test_char_map_rotates_correctly
		en = Decryptor.new

		assert_equal ",", en.rotate_char_map(2)[0]
	end

	def test_hashes_correctly
		en = Decryptor.new

		assert_equal true, en.hash_char_map(en.a_rotated).class == Hash
	end

	def test_it_decrypts
		en = Decryptor.new("ln2cpnx", "11223")

		assert_equal "..end..", en.decrypt
	end

	def test_it_decrypts_another_message
		en = Decryptor.new("n8ekr8.", "13370")

		assert_equal "..end..", en.decrypt
	end

	def test_it_encrypts_and_returns_string
		en = Decryptor.new

		assert_equal true, en.decrypt.class == String
	end
end