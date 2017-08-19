# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "hof_stats/version"

Gem::Specification.new do |spec|
  spec.name          = "hof_stats"
  spec.version       = HofStats::VERSION
  spec.authors       = ["Tony Mastrorio"]
  spec.email         = ["tony.mastrorio@gmail.com"]

  spec.summary       = "MLB Hall of Famers"
  spec.description   = "Provides statistics on all MLB Hall of Famers"
  spec.homepage      = "https://github.com/tonymastrorio/hof_stats"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.executables << 'hof_stats'
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", '~> 0'
  spec.add_development_dependency "nokogiri", '~> 0'
  spec.add_development_dependency "pry", '~> 0'
  
end
