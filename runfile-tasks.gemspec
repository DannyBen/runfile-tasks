lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|
  s.name        = 'runfile-tasks'
  s.version     = '1.0.1'
  s.summary     = 'Runfile tasks collection'
  s.description = 'A collection of tasks for Runfile'
  s.authors     = ['Danny Ben Shitrit']
  s.email       = 'db@dannyben.com'
  s.files       = Dir['README.md', '*.runfile']
  s.homepage    = 'https://github.com/DannyBen/runfile-tasks'
  s.license     = 'MIT'
  s.required_ruby_version = '>= 2.7'
  s.metadata['rubygems_mfa_required'] = 'true'
end
