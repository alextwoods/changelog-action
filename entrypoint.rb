#!/usr/local/bin/ruby

require 'rake'
require 'json'

Dir.chdir '/github/workspace'

# TODO: Use information from the github workflow to determine what the base should be
review_base = 'master'
changes = `git diff --name-only #{review_base}`.split("\n")

puts "Changes: #{changes}"

build_tool_changes = changes.any? { |f| f.start_with? 'build_tools' }

gems_changed = changes.map do |f|
  m = f.match(/gems\/(aws-sdk-[a-z0-9]+)\//)
  if m && m.captures
    m.captures[0]
  end
end.compact

core_changed = gems_changed.include? 'aws-sdk-core'


puts "Attempting to Build"
puts load('Rakefile')
puts "Loading Rakefile.  Tryign to invoke...."
Rake::Task['build'].invoke
generated_changes = `git status --porcelain`

puts "\n\n-------------------------"
puts generated_changes
puts "::set-output name=files_changed::#{JSON.dump(changes)}"
puts "::set-output name=build_tool_changes::#{JSON.dump(build_tool_changes)}"
puts "::set-output name=gems_changed::#{JSON.dump(gems_changed)}"
puts "::set-output name=core_changed::#{JSON.dump(core_changed)}"
puts "::set-output name=generated_changes::#{JSON.dump(generated_changes)}"
