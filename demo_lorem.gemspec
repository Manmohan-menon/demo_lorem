# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'demo_lorem/version'

Gem::Specification.new do |spec|
  spec.name          = "demo_lorem"
  spec.version       = DemoLorem::VERSION
  spec.authors       = ["Manmohan-menon"]
  spec.email         = ["manmohan.menon@gmail.com"]
  spec.description   = %q{Lorem Ipsum generator}
  spec.summary       = %q{simply generates lorem ipsum text.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
