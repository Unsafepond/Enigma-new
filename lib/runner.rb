require './lib/keygen'
require './lib/offset'
require './lib/encryptor'
# require './lib/decryptor'

class Runner
  attr_accessor :key, :date

  def initialize
    @key = Keygen.new.generate
    @date = DateOffset.new.date
  end
end

new_run = Runner.new
puts "Created #{ARGV[1]} with the key #{new_run.key} and date #{new_run.date}"
