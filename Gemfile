source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5.1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.15'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
# Check style
gem 'rails_best_practices'
# Material design
gem 'materialize-sass'
# Add annotation for model classes
gem 'annotate'
# Markdown
gem 'redcarpet'
# For heroku deploy
gem 'rails_12factor', group: :production
# Toast messages
gem 'toastr-rails'
# Fake data
gem 'ffaker'
# Decorators - View Models
gem 'draper'
# Pagination
gem 'kaminari'
# figaro
gem 'figaro'
# bcrypt
gem 'bcrypt'
# image upload
gem 'carrierwave'
gem 'mini_magick'
# omniauth
gem 'omniauth'
gem 'omniauth-facebook', '~> 3.0.0'

group :test do
  # Testing framework go here
  gem 'rspec-rails'

  # Database cleaner
  gem 'database_cleaner'

  # Add matcher
  gem 'shoulda-matchers'

  # Test datas
  gem 'factory_girl_rails'

  # Acceptance test
  gem 'capybara'
  gem 'selenium-webdriver'

  # Test coverages
  gem 'simplecov', :require => false, :group => :test
  gem 'coveralls', require: false
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Speed up
  gem 'spring'
  gem 'spring-commands-rspec'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
end

