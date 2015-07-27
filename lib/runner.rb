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
end

