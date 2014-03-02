Kernel.load 'lib/codelines/version.rb'

Gem::Specification.new { |s|
  s.name          = 'codelines'
  s.version       = CodeLines::VERSION
  s.author        = 'Giovanni Capuano'
  s.email         = 'webmaster@giovannicapuano.net'
  s.homepage      = 'https://github.com/RoxasShadow'
  s.summary       = 'Count how many lines of code are contained in your repositories'
  s.description   = 'Count the number of lines of code contained in one or more repositories hosted on GitHub, Bitbucket, etc.'
  s.licenses      = 'WTFPL'

  s.require_paths = ['lib']
  s.files         = Dir.glob('lib/**/*.rb')
  s.executables   = 'codelines'
  s.test_files    = Dir.glob('test/**/*_spec.rb')

  s.add_dependency 'github_api'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
}