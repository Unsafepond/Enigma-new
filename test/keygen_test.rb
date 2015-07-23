require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/keygen'

class TestKeygen < Minitest::Test
	def test_its_a_thing
		kg = Keygen.new

		assert kg
	end

	def test_it_gives_a_5_digit_number
		kg = Keygen.new
		result = kg.generate.length

		assert_equal 5, result
	end

	def test_number_is_random
		kg = Keygen.new
		result = 5.times.map{kg.generate}.uniq.count

		assert_equal 5, result
	end
end
