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

class EncryptionRunner < Runner

  def start
    puts 'Running!'
  end

  def perform
    puts 'MUCH WORK. VERY HARD. WOW.'
  end

  def finish
    puts 'ALL DONE!'
  end

end

class DecryptionRunner < Runner
end

class CrackRunner < Runner
end
