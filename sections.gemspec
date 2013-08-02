# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sections/version'

Gem::Specification.new do |spec|
  spec.name          = "sections"
  spec.version       = Sections::VERSION
  spec.authors       = ["Daniil Zhirnov"]
  spec.email         = ["danko.master@gmail.com"]
  spec.description   = %q{sections for site}
  spec.summary       = %q{Sample rails gem with generator}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
