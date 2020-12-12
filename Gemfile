source "https://rubygems.org"
ruby "2.7.0"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem "rails", "6.0.3.4"
# Use postgresql as the database for Active Record
gem "pg"
# Use webpacker for building the front end
gem "webpacker"
# Use SCSS for stylesheets
gem "sass-rails", "~> 5.0"
# Use Uglifier as compressor for JavaScript assets
gem "uglifier", ">= 1.3.0"
# Use CoffeeScript for .coffee assets and views
# gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem "jquery-rails"
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem "turbolinks"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.10"
# bundle exec rake doc:rails generates the API under doc/api.
gem "sdoc", "~> 2.0.2", group: :doc

# Use ActiveModel has_secure_password
gem "bcrypt", "~> 3.1.16"

gem "puma" # Multithreading server, used for development and test environments

gem "bootstrap-sass", "~> 3.4.1" # CSS library
gem "normalize-scss", "~> 7.0.1" # CSS library
gem "font-awesome-rails" # CSS library
gem "money-rails" # Currencies
gem "carrierwave" # Image upload functionality
gem "rmagick" # links Ruby to ImageMagick, an image processing library used here for image uploads
gem "stripe" # Payment provider integration

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "byebug"
  gem "dotenv-rails"
  gem "rspec-rails", "~> 4.0" # Allows for natural language (describe, it, etc.) syntax for tests
end

group :development do
  gem "web-console" # Access an IRB console on exception pages or by using <%= console %> in views

  gem "spring" # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
end

group :production do
  gem "newrelic_rpm" # Used for reporting on the health of the deployed webapp
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
  gem "database_cleaner"
end
