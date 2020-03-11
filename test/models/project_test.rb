require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

  def setup
    @user = User.new(email: "lol@lol.lol", password: "12345678")
  end

  test "should not save project without user_id" do
    project = Project.new
    assert_not project.save, "Saved the project without a user_id"
  end

  test "should not save project without name" do
    project = @user.projects.new(name: "")
    assert_not project.save, "Saved the project without a name"
  end

  test "should save project with user_id" do
    project = @user.projects.new
    assert project.save, "Didn't saved the project with a user_id and a name"
  end
end
