lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'runfile-tasks/version'

Gem::Specification.new do |s|
  s.name        = 'runfile-tasks'
  s.version     = RunfileTasks::VERSION
  s.summary     = "Runfile tasks collection"
  s.description = "A collection of tasks for Runfile"
  s.authors     = ["Danny Ben Shitrit"]
  s.email       = 'db@dannyben.com'
  s.files       = Dir['README.md', 'lib/**/*.rb']
  s.homepage    = 'https://github.com/DannyBen/runfile-tasks'
  s.license     = 'MIT'
  s.required_ruby_version = '>= 2.7'
end
