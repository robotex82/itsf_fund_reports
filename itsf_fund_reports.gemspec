$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "itsf/fund_reports/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "itsf_fund_reports"
  s.version     = ITSF::FundReports::VERSION
  s.authors     = ["Roberto Vasquez Angel"]
  s.email       = ["roberto@vasquez-angel.de"]
  s.homepage    = "https://github.com/robotex82/itsf_fund_reports"
  s.summary     = "ITSF Module Template."
  s.description = "ITSF Module Template."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "awesome_print"
  s.add_dependency "fastercsv"
  s.add_dependency "rails", "~> 3.2.13"
  # s.add_dependency "roo"
  s.add_dependency "paperclip", "~> 2.7.0"

  # Development Database
  s.add_development_dependency "sqlite3"

  # Development Server
  s.add_development_dependency "thin"

  # Documentation
  s.add_development_dependency "yard"

  # Dummy app
  s.add_development_dependency 'activeadmin'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'i18n_routing'

  # Localization
  s.add_development_dependency 'localeapp'

  # Tests
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'rspec-rails', '~> 2.0'
  s.add_development_dependency 'shoulda-matchers'
  s.add_development_dependency 'factory_girl_rails', '~> 1.0'

  # Test automation
  s.add_development_dependency 'guard-rails'
  s.add_development_dependency 'rb-inotify', '~> 0.9'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'guard-bundler'

  # Tools
  s.add_development_dependency 'yaml_db'
end

