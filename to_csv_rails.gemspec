$:.push File.expand_path("../lib", __FILE__)
require "to_csv_rails/version"

Gem::Specification.new do |s|
  s.name        = "to_csv_rails"
  s.version     = ToCsvRails::VERSION
  s.authors     = ["Fernando Morgenstern"]
  s.email       = ["contato@fernandomarcelo.com"]
  s.homepage    = "http://fernandomarcelo.com/"
  s.summary     = %q{An to_csv implementation for Rails framework}
  s.description = %q{An to_csv implementation focused on making it easier for Rails developers to export data to CSV format.}
  s.files = Dir["lib/**/*", "CHANGELOG.md", "README.md"]

  s.add_dependency("activerecord", ">= 3.2")

  s.required_ruby_version = '>= 2.0'
end