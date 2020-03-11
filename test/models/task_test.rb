require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  
  def setup
    @user = User.create(email: "lol@lol.lol", password: "12345678")
    @project = @user.projects.create
  end

  test "should not save task without name" do
    task = @project.tasks.new
    assert_not task.save, "Saved the task without a name"
  end

  test "should not save task without project_id" do
    task = Task.new(name: "New test task")
    assert_not task.save, "Saved the task without a project_id"
  end

  test "should save task with title" do
    task = @project.tasks.new(name: "New test task")
    assert task.save, "Didn't saved the task with a project_id and a name"
  end

 # test "should report error" do
  #  assert_raises(NameError) do
   #   some_undefined_variable
    #end
  #end
end
