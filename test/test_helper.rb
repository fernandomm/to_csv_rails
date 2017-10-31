require 'rubygems'
require 'active_record'
require 'minitest/autorun'
require 'to_csv_rails'

ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => ":memory:")

ActiveRecord::Schema.define(:version => 1) do
  create_table :users do |t|
    t.string :name
    t.string :email
  end
end

class User < ActiveRecord::Base
  
end