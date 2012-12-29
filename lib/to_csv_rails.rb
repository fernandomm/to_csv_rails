
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