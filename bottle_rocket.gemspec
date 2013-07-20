# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bottle_rocket/version'

Gem::Specification.new do |spec|
  spec.name          = 'bottle_rocket'
  spec.version       = BottleRocket::VERSION
  spec.authors       = ['Andreas Busold']
  spec.email         = ['an.bu@gmx.net']
  spec.description   = %q{Work in progress! Adds a countdown to your views. Countdown is updated via JavaScript.}
  spec.summary       = %q{Work in progress! Adds a countdown to your views. Countdown is updated via JavaScript.}
  spec.homepage      = 'https://github.com/neopoly/bottle_rocket'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']
  spec.add_dependency 'time_spanner'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'railties'
end
