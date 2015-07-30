require 'minitest/autorun'
require 'minitest/pride'
require './lib/crack'
require './lib/encryptor'

class TestCrack < Minitest::Test
	def test_its_a_thing
		cr = Crack.new
		assert cr
	end

	def test_it_counts_characters_in_input
		cr = Crack.new
		assert_equal cr.character_count, 7
	end

	def test_it_takes_modulo_4
		cr = Crack.new
		assert_equal cr.modulo_four, 3
	end

	def test_it_grabs_last_8ish
		cr = Crack.new
		assert_equal ["ln2c", "pnx"], cr.last_8_characters
	end

end
