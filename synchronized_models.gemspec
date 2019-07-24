$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "synchronized_models/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "synchronized_models"
  spec.version     = SynchronizedModels::VERSION
  spec.authors     = ["Armando Alejandre"]
  spec.email       = ["armando1339@gmail.com"]
  spec.homepage    = "https://github.com/armando1339/synchronized_models"
  spec.metadata    = { source_code_uri: "https://github.com/armando1339/synchronized_models" }
  spec.summary     = "Add a model into another model with an external database connection."
  spec.description = "Add a model into another model with an external database connection."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 5.2.3"

  spec.add_development_dependency "pg"
  spec.add_development_dependency "mysql2"
  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency "pry"
end
