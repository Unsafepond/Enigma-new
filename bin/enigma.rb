#!/usr/bin/env ruby

require_relative '../lib/runner'

infile, outfile, key, date = ARGV

runner = Runner.for(infile: infile, outfile: outfile, key: key, date: date)

puts runner.class


puts "input key"
key = gets.chomp
puts "input date"
date = gets.chomp
if date == ""
	key = Keygen.new.generate
	date = DateOffset.new.offset
elsif 
end

