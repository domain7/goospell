# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'goospell/version'

Gem::Specification.new do |gem|
  gem.name          = "goospell"
  gem.version       = Goospell::VERSION
  gem.authors       = ["Shane Davies"]
  gem.email         = ["shane@domain7.com"]
  gem.description   = %q{Spell checker that uses the undocumented Google Spell API}
  gem.summary       = %q{Spell checker that uses the undocumented Google Spell API}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency('to_xml')

  gem.add_dependency('rexml-expansion-fix')

  gem.add_development_dependency('rake')
end
