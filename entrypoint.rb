#!/usr/local/bin/ruby

require 'rake'

puts "Hello #{ARGV[0]}"
puts ENV.inspect
puts "-----------------------\n\n"
puts `ls /github/workspace`
puts "*************************``"
puts "GIT: #{`which git`}"
puts "::set-output name=time::#{Time.now}"


Dir.chdir '/github/workspace'
puts "Attempting to Build"
Rake::Task['build'].invoke
changes = `git status --porcelain`
puts "\n\n-------------------------"
puts changes
