class FileIO

  def read_file(input_text)
    infile = input_text.read
  end

  def write_file(output_text)
    outfile = File.open(ARGV[1], "w")
    outfile.write(output_text)
    outfile.close
  end

  def input_key
    puts "Input Key (for seeded encryption or decryption): "
    key = $stdin.gets.chomp

    if key.length == 5
      key
    else
      nil
    end
  end

  def input_date
    puts "Input Date (DDMMYY) (Blank for current date): "
    date = $stdin.gets.chomp

    if date.length == 6
      date
    else
      nil
    end
  end
end
