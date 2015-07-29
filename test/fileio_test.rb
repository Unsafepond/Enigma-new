require 'minitest/autorun'
require 'minitest/pride'
require './lib/fileio'

class FileIOTest < Minitest::Test
  def test_it_exists
    temp = FileIO.new
    assert temp
  end

  def test_if_user_key_is_5_characters_it_assigns_it_to_key
    temp = FileIO.new.input_key
    assert temp.input_key.key
  end
end
