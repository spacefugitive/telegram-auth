lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'telegram/auth'

Gem::Specification.new do |spec|
  spec.name          = "telegram-auth"
  spec.version       = Telegram::Auth::VERSION
  spec.authors       = ["Aninda"]
  spec.email         = ["spacefugitive@gmail.com"]

  spec.summary       = %q{Gem to verify the auth hash for a telegram domain}
  spec.description   = %q{Gem to verify the auth hash for a telegram domain}
  spec.license       = "MIT"

  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.1.4"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.9"
end