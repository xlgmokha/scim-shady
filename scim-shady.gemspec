
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "scim/shady/version"

Gem::Specification.new do |spec|
  spec.name          = "scim-shady"
  spec.version       = Scim::Shady::VERSION
  spec.authors       = ["mo"]
  spec.email         = ["mo@mokhan.ca"]

  spec.summary       = %q{A simple toolkit for implementing SCIM schema. https://tools.ietf.org/html/rfc7643}
  spec.description   = %q{A simple toolkit for implementing SCIM schema. https://tools.ietf.org/html/rfc7643}
  spec.homepage      = "http://www.mokhan.ca/"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "scim-kit", "~> 0.2"
  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "ffaker"
end
