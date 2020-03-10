

Given("I am on the {string} page") do |page_name|
    visit page_name_path
end

When("I press {string} button") do |string|
    click_button(button)
end

Then("I should see a new project") do
    pending # Write code here that turns the phrase above into concrete actions
end