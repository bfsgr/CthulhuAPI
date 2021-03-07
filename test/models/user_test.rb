require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'user saves correctly' do
    user = User.new(username: 'John', email: 'john@example.com', password: 'qwerty1234')
    user.game_sets << GameSet.create(name: 'Default')
    assert user.save
  end

  test 'user should not save without username' do
    user = User.new(email: 'john@example.com', password: 'qwerty1234')
    assert_not user.save
  end

  test 'user should not save with username less than 4 characters' do
    user = User.new(username: 'ana', email: 'john@example.com', password: 'qwerty1234')
    assert_not user.save
  end

  test 'user should not save with username more than 25 characters' do
    user = User.new(username: 'aaaaaaaaaaaaaaaaaaaaaaaaaa', email: 'john@example.com', password: 'qwerty1234')
    assert_not user.save
  end

  test 'user should not save with username with @' do
    user = User.new(username: 'John@home', email: 'john@example.com', password: 'qwerty1234')
    assert_not user.save
  end
end
