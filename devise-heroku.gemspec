$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "devise-heroku/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "devise-heroku"
  s.version     = DeviseHeroku::VERSION
  s.authors     = ["Adam Schepis"]
  s.email       = ["adam.schepis@gmail.com"]
  s.homepage    = "https://github.com/aschepis/devise-heroku"
  s.summary     = "Heroku SSO Strategy for Devise"
  s.description = "Heroku SSO Strategy for Devise"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 3.1.1"
end
