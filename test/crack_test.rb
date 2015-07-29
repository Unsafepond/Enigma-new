require 'minitest/autorun'
require 'minitest/pride'
require './lib/crack'
require './lib/encryptor'

class TestCrack < Minitest::Test
	def test_its_a_thing
		cr = Crack.new
		assert cr
	end

	
end