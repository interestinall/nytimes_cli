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
  spec.bindir        = "bin"

 

  spec.files         = ["lib/nytimes_cli/cli.rb", "lib/nytimes_cli/navagation.rb", "lib/nytimes_cli/version.rb", "lib/article.rb", "lib/nytimes_cli.rb", "lib/scraper.rb", "bin/console", "bin/nytimes_cli", "bin/setup"]
  spec.executables   = ["nytimes_cli"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "require_all" , '~> 1.3', '>= 1.3.3'
  spec.add_development_dependency "mechanize", '~> 2.7', '>= 2.7.4'
  spec.add_runtime_dependency "require_all" , '~> 1.3', '>= 1.3.3'
  spec.add_runtime_dependency 'mechanize', '~> 2.7', '>= 2.7.4'



end
