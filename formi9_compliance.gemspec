require_relative 'lib/formi9_compliance/version'

Gem::Specification.new do |spec|
  spec.name          = "formi9_compliance"
  spec.version       = Formi9Compliance::VERSION
  spec.authors       = ["Ryan Lv"]
  spec.email         = ["tech@workstream.is"]

  spec.summary       = 'A Ruby API wrapper for formi9.com'
  spec.description   = spec.summary
  spec.homepage      = 'https://github.com/helloworld1812/formi9_compliance'
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = 'https://github.com/helloworld1812/formi9_compliance'
  spec.metadata["changelog_uri"] = 'https://github.com/helloworld1812/formi9_compliance/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", ">= 1.17"
  spec.add_development_dependency "rake", ">= 12.3.3"
  spec.add_development_dependency "rspec", ">= 3.9.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "webmock"
  spec.add_runtime_dependency 'faraday'
  spec.add_runtime_dependency 'faraday_middleware'
end
