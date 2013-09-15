$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "firefly/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "firefly"
  s.version     = Firefly::VERSION
  s.authors     = ["Whitney Young"]
  s.homepage    = "https://github.com/wbyoung/firefly"
  s.summary     = "Event tracking for iOS and Mac apps."
  s.description = "Event tracking for iOS and Mac apps. See the GitHub page for more details."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.0.0"
  s.add_dependency 'sass-rails', '~> 4.0.0'
  s.add_dependency 'haml-rails', '~> 0.4'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'capybara-webkit'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'jasmine-rails'
  s.add_development_dependency 'pg'

  s.test_files = Dir["spec/**/*"]
end
