# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nse1/version'

Gem::Specification.new do |spec|
  spec.name          = "nse1"
  spec.version       = Nse1::VERSION
  spec.authors       = ["Ankit Agarwal"]
  spec.email         = ["ankitagarwal24.8@gmail.com"]
  spec.description   = %q{NSE (National Stock Exchange of India) equity stock data from www.nseindia.com. Originally developed for www.tradeoo.in}
  spec.summary       = %q{NSE (National Stock Exchange of India) equity stock data from www.nseindia.com. Originally developed for www.tradeoo.in}
  spec.homepage      = "https://github.com/ankitagarwal248/NSE1"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_runtime_dependency "nokogiri"
  spec.add_runtime_dependency "crack"
  # spec.add_runtime_dependency "open-uri"
  spec.add_development_dependency "rake"
end
