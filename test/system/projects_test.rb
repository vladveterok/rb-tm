require "application_system_test_case"

class ProjectsTest < ApplicationSystemTestCase
  setup do
    @user = users(:test_user_01)
    @project = projects(:project_01)
  end

  test "visiting the sign_in" do
    visit new_user_session_path
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.encrypted_password
    click_on "Log in"
  end

  test "visiting the index" do
    visit projects_url
    assert_selector "h1", text: "RubyDo"
  end

  test "creating a Project" do
    visit projects_url
    click_on "add-todo-list"

    fill_in "new-project-name", with: @project.name

    assert_text "MyString"
  end

  test "updating a Project" do
    visit projects_url
    click_on "Edit", match: :first

    fill_in "Name", with: @project.name
    fill_in "User", with: @project.user_id
    click_on "Update Project"

    assert_text "Project was successfully updated"
    click_on "Back"
  end

  test "destroying a Project" do
    visit projects_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Project was successfully destroyed"
  end
end
