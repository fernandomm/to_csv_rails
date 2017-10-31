
require 'csv'
require 'to_csv_rails/export'
require 'to_csv_rails/version'

[Array, ActiveRecord::Relation].each do |klass|
  klass.prepend(ToCsvRails::Export)
end

if defined?(ActionController::Renderers) && ActionController::Renderers.respond_to?(:add)
  ActionController::Renderers.add :csv do |csv, options|
    self.content_type ||= ActiveRecord::VERSION::MAJOR < 5 ? Mime::CSV : Mime[:csv]
    self.response_body = csv.respond_to?(:to_csv) ? csv.to_csv : csv
  end
end