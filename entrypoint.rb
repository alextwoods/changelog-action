#!/usr/local/bin/ruby

puts "Hello #{ARGV[0]}"
puts ENV.inspect
puts "-----------------------\n\n"
puts `ls /github/workspace`
puts "::set-output name=time::#{Time.now}"
