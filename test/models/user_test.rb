require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(username: 'John', email: 'john@example.com', password: 'qwerty1234')
  end

  test 'user saves correctly' do
    @user.game_sets << GameSet.create(name: 'Default')
    assert @user.save
  end

  test 'user should not save without username' do
    @user.username = nil
    assert_not @user.save
  end

  test 'user should not save with username less than 4 characters' do
    @user.username = 'ana'
    assert_not @user.save
  end

  test 'user should not save with username more than 25 characters' do
    @user.username = 'aaaaaaaaaaaaaaaaaaaaaaaaaa'
    assert_not @user.save
  end

  test 'user should not save with username with @' do
    @user.username = 'John@home'
    assert_not @user.save
  end
end
