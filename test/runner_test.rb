require 'minitest/autorun'
require 'minitest/pride'
require './lib/runner'

class RunnerTest < Minitest::Test
  def test_it_exists
    new_run = Runner
    assert new_run
  end

  def test_it_calls_Keygen_class_on_new_instance
    new_run = Runner.new
    assert new_run.key
  end

  def test_it_calls_DateOffset_class_on_new_instance
    new_run = Runner.new
    assert new_run.date
  end
end
