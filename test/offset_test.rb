require 'minitest/autorun'
require 'minitest/pride'
require './lib/offset'

class DateOffsetTest < Minitest::Test
  def test_it_exists
    offset = DateOffset.new
    assert offset
  end

  def test_it_can_get_current_date_in_UTC
    current_date = DateOffset.new
    assert_equal current_date.date, Time.new.strftime("%d%m%y").to_i
  end

  def test_it_can_square_the_date
    current_date = DateOffset.new
    date_square = current_date.date_square
    expected = Time.new.strftime("%d%m%y").to_i ** 2
    assert_equal date_square, expected
  end

  def test_it_returns_4_characters
    date = DateOffset.new.offset
    assert_equal date.length, 4
  end
end
