# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cdns/version'

Gem::Specification.new do |gem|
  gem.name          = "cdns"
  gem.version       = CDNS::VERSION
  gem.authors       = ["Ramon Soares"]
  gem.email         = ["ramon@codecraft63.com"]
  gem.description   = %q{Simple DNS Server for CDN}
  gem.summary       = %q{Simple DNS Server for CDN}
  gem.homepage      = "http://github.com/codecraft63/cdns"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "geoip-c",             "~> 0.8.1"
  gem.add_dependency "redis",               "~> 3.0.2"
  gem.add_dependency "multi_json",          "~> 1.4.0"
  gem.add_dependency "yajl-ruby",           "~> 1.1.0"
  
  # CLI
  gem.add_dependency "thor",                "~> 0.16.0"

  gem.add_development_dependency "rspec",   "~> 2.12.0"
end
