require './lib/keygen'
require './lib/offset'
require './lib/encryptor'
# require './lib/decryptor'

class Runner

  def self.for(options = {})
    if options[:key] && options[:date]
      DecryptionRunner.new(options)
    elsif options[:date]
      CrackRunner.new(options)
    else
      encrypted = Encryptor.new(options[:infile], key = Keygen.new.generate,
        offset = DateOffset.new.offset)
      output_text = FileIO.new.write_file(encrypted.encrypt)
      puts "Created encrypted.txt with the key #{key} and the date #{Time.new.strftime("%d%m%y")}"
    end
  end

  def initialize(options)
    @options = options
  end

  def run
    start
    perform
    finish
  end

  def start
  end

  def perform
  end

  def finish
  end
end
