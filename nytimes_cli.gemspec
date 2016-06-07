# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nytimes_cli/version'

Gem::Specification.new do |spec|
  spec.name          = "nytimes_cli"
  spec.version       = NytimesCli::VERSION
  spec.authors       = ["interestinall"]
  spec.email         = ["justin.lefurjah@gmail.com"]

  spec.summary       = %q{Command line interface for nytimes.com}
  spec.description   = %q{Allows users to browse nytimes.com and read articles from the command line.}
  spec.homepage      = "https://github.com/interestinall/nytimes_cli"
  spec.license       = "MIT"

 

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
