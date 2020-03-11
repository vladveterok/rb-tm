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

  test "should save task with name" do
    task = @project.tasks.new(name: "New test task")
    assert task.save, "Didn't saved the task with a project_id and a name"
  end

  test "should update task name" do
    task = @project.tasks.new(name: "New test task")
    task.update(name: 'I have a new name')
    task.save
    assert_equal 'I have a new name', task.name, "Didn't update the task name"
  end

  test "should not update task adding empty name" do
    task = @project.tasks.new(name: "New test task")
    task.save
    assert_not task.update(name: ''), "Updated the task with '' name"
  end

  test "should change task status to 'completed' and back" do
    task = @project.tasks.new(name: "New test task")
    task.update(completed: true)
    task.save
    assert_equal true, task.completed, "Didn't change the task status to true"
    task.update(completed: false)
    assert_equal false, task.completed, "Didn't change the task status to false"
  end

  test "should call task.toggle_completed! method to change task status to 'completed' and back" do
    task = @project.tasks.new(name: "New test task")
    task.toggle_completed!
    assert_equal true, task.completed, "Didn't change the task status to true"
    task.toggle_completed!
    assert_equal false, task.completed, "Didn't change the task status to false"
  end

  test "should assign deadline" do
    task = @project.tasks.new(name: "New test task")
    date = Date.new(2020, 03, 15)
    task.update(due_day: date)
    task.save
    assert_equal date, task.due_day, "Didn't update the task deadline"
  end

  test "should destroy task" do
    task = @project.tasks.new(name: "New test task")
    task.destroy
    assert_not_includes tasks, task, "Didn't destroy the task"
  end
end
