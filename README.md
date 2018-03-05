# Cubits Assignment

### INSTALL 

After installing the [XCode](https://developer.apple.com/xcode/), you will need to install [Homebrew](https://brew.sh/). Go to your Terminal and run:

```
$ ruby -e “$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)” .
``` 

After having the Homebrew installed, you will install [Qt](https://www.qt.io/):

```
$ brew install qt
```

Now install the [Ruby Version Manager (RVM)] (https://rvm.io/):

```
$ gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
$ curl -sSL https://get.rvm.io | bash -s stable
```

Restart the Terminal.

In case "curl" isn't yet installed type in the terminal: 

```
brew install curl
```

Let's now install [Geckodriver] (https://github.com/mozilla/geckodriver/releases):

```
$ curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
$ sudo apt-get install jq nodejs curl -qy
$ sudo npm install -g geckodriver
```

Install [node.js] (https://nodejs.org/en/):

```
$ brew install node
```

Now run these commands to install [Bundler] (http://bundler.io/) and [Cucumber] (https://cucumber.io/)	

```
$ sudo gem install bundler
$ xcode-select --install
$ bundle install
```

Install [Chrome] (https://www.google.com/chrome/) for your OS

### PREPARE ENVIRONMENT FOR MOBILE TESTS

Inside the project's folder create a Gemfile with the following gems:

```
source 'https://rubygems.org'

gem 'cucumber', '~> 3.1'
gem 'capybara', '~> 2.16', '>= 2.16.1'
gem 'selenium-webdriver', '~> 3.8'
```

Back to your folder run:

```
$ bundle install
```

And then run:

```
$ cucumber --init
```

Inside ./features/support/env.rb copy:

```
require 'capybara/cucumber'
require 'selenium-webdriver'

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Capybara.default_driver = :selenium_chrome
Capybara.default_max_wait_time = 40
 	 
Capybara.app_host = "https://cubits.com/"
```

Inside /features/specifications create a .feature and copy:

```
Feature: Login

Scenario: Login on Cubits webpage   

Given I click on Login
When I fill in obligatory fields
Then I will successfully login`

Inside /features/step_definitions create a .rb and copy:

`Given("I click on Login") do
	visit 'https://cubits.com/'
	within('ul.nav__login') do
		puts find('a', :text => 'LOGIN')
		find('a', :text => 'LOGIN').click
	end
end


When("I fill in obligatory fields") do
  fill_in 'user_email', :with => 'your-user-email'
  fill_in 'user_password', :with => 'your-password'
  	find('button', :text => 'LOGIN').click
end

Then("I will successfully login") do
  page.has_content?('Welcome to your dashboard.')
end
```

Now inside the folder where ./features is located run:

```
$ cucumber
```


