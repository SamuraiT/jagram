# frozen_string_literal: true

require_relative "lib/jagram/version"

Gem::Specification.new do |spec|
  spec.name          = "jagram"
  spec.version       = Jagram::VERSION
  spec.authors       = ["samurait"]
  spec.email         = ["t.yasukawa01@gmail.com"]

  spec.summary       = "jagram is JApanese proGRAMming language"
  spec.description   = "jagram is made for japanese programming eduction purpose"
  spec.homepage      = "https://github.com/SamuraiT/jagram"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.4.0")

  spec.metadata["allowed_push_host"] = "https://github.com/SamuraiT/jagram"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/SamuraiT/jagram"
  spec.metadata["changelog_uri"] = "https://github.com/SamuraiT/jagram/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
