# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'likestore/version'

Gem::Specification.new do |gem|
  gem.name          = "likestore"
  gem.version       = Likestore::VERSION
  gem.authors       = ["Duke"]
  gem.email         = ["duke@riseup.net"]
  gem.description   = %q{A Ruby interface to the LikeStore API.}
  gem.summary       = gem.description
  gem.email         = ['duke.m16@gmail.com']
  gem.homepage      = "http://github.com/dukex/likestore"
  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = Dir.glob("spec/**/*")
  gem.require_paths = ["lib"]

  gem.add_dependency 'faraday'
  gem.add_dependency 'multi_json'
  gem.add_development_dependency 'bundler', '~> 1.0'
end
