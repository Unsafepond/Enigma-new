require './lib/keygen'
require './lib/offset'
require './lib/encryptor'
require './lib/decryptor'

class Runner

  def self.for(options = {})
    if options[:key] && options[:date]
      offset = DateOffset.new(options[:date].to_i).offset
      decrypted = Decryptor.new(options[:infile], options[:key], offset)
      output_text = FileIO.new.write_file(decrypted.decrypt)
      puts "Created #{ARGV[1]} with the key #{options[:key]} and the date #{options[:date]}"
    elsif options[:date]
      CrackRunner.new(options)
    else
      encrypted = Encryptor.new(options[:infile], key = Keygen.new.generate,
        offset = DateOffset.new.offset)
      output_text = FileIO.new.write_file(encrypted.encrypt)
      puts "Created #{ARGV[1]} with the key #{key} and the date #{Time.new.strftime("%d%m%y")}"
    end
  end

  def initialize(options)
    @options = options
  end
end
