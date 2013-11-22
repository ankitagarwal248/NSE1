# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nse1/version'

Gem::Specification.new do |spec|
  spec.name          = "nse1"
  spec.version       = Nse1::VERSION
  spec.authors       = ["rahul"]
  spec.email         = ["rahul2501350@gmail.com"]
  spec.description   = %q{some description}
  spec.summary       = %q{some summary}
  spec.homepage      = "http://tradeoo.in"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
