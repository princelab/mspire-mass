# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mspire/mass/version'

Gem::Specification.new do |spec|
  spec.name          = "mspire-mass"
  spec.version       = Mspire::Mass::VERSION
  spec.authors       = ["John T. Prince"]
  spec.email         = ["jtprince@gmail.com"]
  spec.summary       = %q{mspire library for mass calculations.}
  spec.description   = %q{mspire library for mass calculations.  Mainly holds constants for simple lookup.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  [
    # should probably be its only dependency
    ["mspire-isotope", "~> 0.1.0"],
  ].each do |args|
    spec.add_dependency(*args)
  end

  [
    ["bundler", "~> 1.6.2"],
    ["rake"],
    ["rspec", "~> 2.14.1"], 
    ["rdoc", "~> 4.1.1"], 
    ["simplecov", "~> 0.8.2"],
  ].each do |args|
    spec.add_development_dependency(*args)
  end

end
