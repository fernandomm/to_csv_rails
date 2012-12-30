
if RUBY_VERSION >= '1.9'
  require 'csv'
  CSV_HANDLER = CSV
else
  begin
    gem 'fastercsv'
    require 'fastercsv'

    CSV_HANDLER = FasterCSV
  rescue LoadError => e
    raise "Error : FasterCSV not installed, please run: gem install fastercsv"
  end
end

require "to_csv_rails/version"
require "to_csv_rails/array.rb"

if defined?(ActionController::Renderers) && ActionController::Renderers.respond_to?(:add)
  ActionController::Renderers.add :csv do |csv, options|
    self.content_type ||= Mime::CSV
    self.response_body = csv.respond_to?(:to_csv) ? csv.to_csv : csv
  end
end