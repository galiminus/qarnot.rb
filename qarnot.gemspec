# -*- encoding: utf-8 -*-

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "fafuse/version"

Gem::Specification.new do |gem|
  gem.name          = "qarnot"
  gem.version       = FAFuse::VERSION
  gem.authors       = ["Victor Goya"]
  gem.email         = ["phorque@phorque.it"]
  gem.description   = "Ruby bindings to Qarnot REST API"
  gem.summary       = "Ruby bindings to Qarnot REST API"
  gem.homepage      = "https://phorque.it"

  gem.files         = `git ls-files -z`.split("\x0")
  gem.executables   = %w(qarnot)
  gem.require_paths = ["lib"]
  gem.bindir        = 'bin'

  gem.licenses      = ["MIT"]

  gem.required_ruby_version = "~> 2.0"

  gem.add_dependency 'rest-client', '~> 2.0', '>= 2.0.2'
  gem.add_dependency 'boson', '~> 1.3.0', '>= 1.3.0'
  gem.add_dependency 'activesupport', '~> 5.1.2', '>= 5.1.2'

  gem.add_development_dependency "byebug"
end
