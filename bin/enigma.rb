#!/usr/bin/env ruby

require './lib/runner'

infile, outfile, key, date = ARGV

runner = Runner.for(infile: infile, outfile: outfile, key: key, date: date)

puts runner.class
