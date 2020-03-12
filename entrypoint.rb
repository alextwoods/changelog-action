#!/usr/local/bin/ruby

puts "Hello #{ARGV[0]}"
puts "::set-output name=time::#{Time.now}"
