require 'test_helper'

class CsvTest < Minitest::Test
  def teardown
    User.destroy_all
  end

  def test_simple_export
    user1 = User.create! :name => 'User 1', :email => 'user1@email.com'
    user2 = User.create! :name => 'User 2', :email => 'user2@email.com'

    data = User.all
    
    assert_equal "#{user1.id},user1@email.com,User 1\n#{user2.id},user2@email.com,User 2\n",
      data.to_csv
  end

  def test_export_with_empty_data
    data = User.all

    assert_equal "",
      data.to_csv
  end

  def test_export_with_only_option
    User.create! :name => 'User 1', :email => 'user1@email.com'
    User.create! :name => 'User 2', :email => 'user2@email.com'

    data = User.all

    assert_equal "User 1\nUser 2\n",
      data.to_csv(:only => [:name])
  end

  def test_export_with_except_option
    User.create! :name => 'User 1', :email => 'user1@email.com'
    User.create! :name => 'User 2', :email => 'user2@email.com'

    data = User.all

    assert_equal "user1@email.com\nuser2@email.com\n",
      data.to_csv(:except => [:id, :name])
  end

  def test_export_with_headers_option
    user1 = User.create! :name => 'User 1', :email => 'user1@email.com'
    user2 = User.create! :name => 'User 2', :email => 'user2@email.com'

    data = User.all

    assert_equal "id,name,email\n#{user1.id},user1@email.com,User 1\n#{user2.id},user2@email.com,User 2\n",
      data.to_csv(:headers => [:id, :name, :email])
  end
end
