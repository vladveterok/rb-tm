require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  test "should not save user without email" do
    user = User.new(password: "12345678")
    assert_not user.save, "Saved the user without an email" 
  end

  test "should not save user without password" do
    user = User.new(email: "lol@lol.lol")
    assert_not user.save, "Saved the user without a password" 
  end
  
  test "should save user" do
    user = User.new(email: "lol@lol.lol", password: "12345678")
    assert user.save, "Didn't save the user with an email and a password" 
  end
end
