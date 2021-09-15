# frozen_string_literal: true

require_relative 'lib/bike_reg/version'

Gem::Specification.new do |spec|
  spec.name          = 'bike_reg'
  spec.version       = BikeReg::VERSION
  spec.authors       = ['Scott Olsen']
  spec.email         = ['solsen300@gmail.com']
  spec.homepage      = 'https://github.com/scottolsen/bike_reg'
  spec.summary       = 'Gem to hit the BikeReg.com API'
  spec.description   = 'Gem to hit the BikeReg.com API. BikeReg API docs here https://www.bikereg.com/api/EventSearchDoc.aspx'
  spec.license       = 'MIT'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.5'

  spec.add_dependency 'faraday', '~> 1.7'
  spec.add_dependency 'faraday_middleware', '~> 1.1'
end
