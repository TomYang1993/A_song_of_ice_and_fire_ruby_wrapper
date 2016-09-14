# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'GOT_wrapper/version'

Gem::Specification.new do |spec|
  spec.name          = "GOT_wrapper"
  spec.version       = GOTWrapper::VERSION
  spec.authors       = ["Tom Yang"]
  spec.email         = ["xy2286@columbia.edu"]

  spec.summary       = %q{ A wrapper for A song of fire and ice}
  spec.description   = %q{ Easily use the API }
  spec.homepage      = "https://github.com/TomYang1993/A_song_of_ice_and_fire_ruby_wrapper.git"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    # spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_dependency "unirest", "~> 1.1.2"
end
