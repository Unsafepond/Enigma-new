require './lib/keygen'
require './lib/offset'
# require './lib/encryptor'
# require './lib/decryptor'

class Runner

  def self.for(options = {})
    if options[:key] && options[:date]
      DecryptionRunner.new(options)
    elsif options[:date]
      CrackRunner.new(options)
    else
      EncryptionRunner.new(options)
    end
  end

  def initialize(options)
<<<<<<< HEAD
    @options = options
  end
end

class EncryptionRunner < Runner

  def key
    @key = Keygen.new.generate
  end

  puts "Created 'encrypted.txt' with the key #{EncryptionRunner.new.key} and the date #{Time.new.strftime("%d%m%y")}"
end

class DecryptionRunner < Runner
end

class CrackRunner < Runner
end
=======
    @options = options
  end
end

>>>>>>> 7deba20f09d4ac17011745f5a374770c6b748ff3
