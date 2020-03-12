#!/usr/local/bin/ruby

require 'rake'

puts "Hello #{ARGV[0]}"
puts ENV.inspect
puts "-----------------------\n\n"
puts `ls /github/workspace`
puts "*************************``"
puts "GIT: #{`which git`}"


Dir.chdir '/github/workspace'
puts "Attempting to Build"
puts load('Rakefile')
puts "Loading Rakefile.  Tryign to invoke...."
Rake::Task['build'].invoke
changes = `git status --porcelain`
puts "\n\n-------------------------"
puts changes
puts "::set-output name=changes::#{changes}"
