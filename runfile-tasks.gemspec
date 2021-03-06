lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'date'
require 'runfile-tasks/version'

Gem::Specification.new do |s|
  s.name        = 'runfile-tasks'
  s.version     = RunfileTasks::VERSION
  s.date        = Date.today.to_s
  s.summary     = "Runfile tasks collection"
  s.description = "A collection of tasks for Runfile"
  s.authors     = ["Danny Ben Shitrit"]
  s.email       = 'db@dannyben.com'
  s.files       = Dir['README.md', 'lib/**/*.rb']
  s.homepage    = 'https://github.com/DannyBen/runfile-tasks'
  s.license     = 'MIT'

  s.add_runtime_dependency 'runfile', '~> 0.5'
end
