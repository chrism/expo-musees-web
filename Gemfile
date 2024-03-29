source 'https://rubygems.org'
ruby '2.1.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.5'
# Use postgresql as the database for Active Record
gem 'pg'

# SERVER

# manage processes
gem 'foreman', '~> 0.75.0'

# app server
gem 'unicorn', '~> 4.8.3'

# grabbing data
gem 'rest-client', '~> 1.7.2'

# sanitize Uniteam API
gem 'sanitize-rails', '~> 1.0.0'

# FRONT END

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use jquery as the JavaScript library
gem 'jquery-rails'

gem 'bourbon', '~> 3.2.1'
gem 'neat', '~> 1.5.1'

gem 'kaminari', '~> 0.16.1'

# WORKFLOW

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
group :development do
  gem 'spring'
  gem 'spring-commands-rspec', '~> 1.0.2'
  gem 'guard-rspec', '~> 4.3.1', require: false
  gem 'guard-livereload', '~> 2.3.0', require: false
  gem 'quiet_assets', '~> 1.0.3'
end

# TESTING

group :development, :test do
  gem 'figaro', '~> 1.0.0'
  gem 'rspec-rails', '~> 3.1.0'
  gem 'factory_girl_rails', '~> 4.4.1'
end

group :test do
  gem 'faker', '~> 1.4.3'
  gem 'capybara', '~> 2.4.1'
  gem 'database_cleaner', '~> 1.3.0'
  gem 'launchy', '~> 2.4.2'
  gem 'selenium-webdriver', '~> 2.42.0'
  gem 'rspec-collection_matchers', '~> 1.0.0'
  gem 'vcr', '~> 2.9.3'
  gem 'webmock', '~> 1.18.0'
end

# UNUSED GEMS COME WITH RAILS

# Use CoffeeScript for .js.coffee assets and views
# gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.0'

# bundle exec rake doc:rails generates the API under doc/api.
# gem 'sdoc', '~> 0.4.0',          group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
gem 'debugger', group: [:development, :test]