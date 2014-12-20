$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'geopolitical/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'geopolitical'
  s.version     = Geopolitical::VERSION
  s.authors     = ['Marcos Piccinini']
  s.email       = ['x@nofxx.com']
  s.homepage    = 'http://github.com/nofxx/geopolitical'
  s.summary     = 'Geopolitical models for mongoid.'
  s.description = 'Geopolitical models for mongoid as a rails engine.'
  s.license   = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*'] + ['MIT-LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['spec/**/*']

  s.add_dependency 'rails', '>= 4.0.0'
  s.add_dependency 'mongoid', '~> 4.0'
  s.add_dependency 'mongoid_geospatial'
end
