# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth-alfred/version', __FILE__)

Gem::Specification.new do |s|
  s.name          = 'omniauth-alfred'
  s.version       = OmniAuth::Alfred::VERSION
  s.authors       = ['Ekaterina Barasheva']
  s.email         = ['ekaterina.barasheva@cybergizer.com']
  s.description   = 'OmniAuth strategy for Alfred'
  s.summary       = 'OmniAuth strategy for Alfred'
  s.homepage      = "https://github.com/cybergizer-hq/omniauth-alfred"
  s.license       = "MIT"

  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ["lib"]

  s.add_dependency 'omniauth', '~> 1.0'
  s.add_dependency 'omniauth-oauth2', '~> 1.0'
end
