Given("I click on Login") do
	visit 'https://cubits.com/'
	within('ul.nav__login') do
		puts find('a', :text => 'LOGIN')
		find('a', :text => 'LOGIN').click
	end
end


When("I fill in obligatory fields") do
  fill_in 'user_email', :with => 'soudecarvalho@gmail.com'
  fill_in 'user_password', :with => 'Cub175-L0g1n-P0rr@'
  	find('button', :text => 'LOGIN').click
end

Then("I will successfully login") do
  page.has_content?('Welcome to your dashboard.')
end