# frozen_string_literal: true

require_relative "lib/strong_service"

Gem::Specification.new do |spec|
  spec.name = "strong_service"
  spec.version = "1.0.0"
  spec.authors = ["Jamie Schembri"]
  spec.email = ["jamie@schembri.me"]

  spec.summary = "The best Ruby gem for service objects."
  spec.description = "The lightweight, zero-dependency, infinitely configurable Service Object Ruby gem."
  spec.homepage = "https://github.com/shkm/strong_service"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[etc/ bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
