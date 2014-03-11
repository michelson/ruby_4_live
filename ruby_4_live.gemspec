# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruby_4_live/version'

Gem::Specification.new do |spec|
  spec.name          = "ruby_4_live"
  spec.version       = Ruby4Live::VERSION
  spec.authors       = ["Peter Marks"]
  spec.email         = ["(petertmarks@gmail.com)"]
  spec.description   = "A Ruby implementation of the Ableton Live API."
  spec.summary       = "The current version connects to an included Max For Live patch via OSC to interact with the API. "
  spec.homepage      = "https://github.com/tassock/ruby_4_live"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_dependency "rosc"
end
