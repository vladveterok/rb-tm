Given ("I am logged in as a user") do
	user = User.create!(:email => 'test@example.com', :password => 'f4k3p455w0rd')
	login_as(user, :scope => :user)
	
end

Given("I am on the {string} page") do |page|
	current_path = URI.parse(current_url).path # to test what page is current
	visit "/#{page}"
	byebug
end

#When("I fill in {string} field with {string}") do |field, cred|
#	fill_in field, with: cred	
#end

When("I press {string} button") do |button|
	click_on(button)
end

Then("I should be on the {string} page") do |page|
current_path = URI.parse(current_url).path
expect(page).to have_xpath(current_path)
end

Then("I should see a new project") do
	pending # Write code here that turns the phrase above into concrete actions
end

