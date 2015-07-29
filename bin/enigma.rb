#!/usr/bin/env ruby

require './lib/runner'
require './lib/fileio'

input_text = File.open(ARGV[0], "r")
infile = FileIO.new.read_file(input_text)
outfile = ARGV[1]
key = FileIO.new.input_key
date = FileIO.new.input_date
# def write_file(text)
#   outfile = File.open(ARGV[1], "w")
#   outfile.write(text)
#   outfile.close
# end

runner = Runner.for(options = {infile: infile, outfile: outfile, key: key, date: date})
