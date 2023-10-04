# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

gem 'bootsnap', require: false
gem 'devise'
gem 'fastlane'
gem 'font-awesome-sass'
gem 'importmap-rails'
gem 'jbuilder'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.7'
gem 'rake'
gem 'simple_form'
gem 'slim-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'versionomy'
gem 'view_component'

# prettier
gem 'prettier_print'
gem 'syntax_tree'
gem 'syntax_tree-haml'
gem 'syntax_tree-rbs'

# bootstrap and dependencies
gem 'bootstrap', '~> 5.3.1'
gem 'jquery-rails'
gem 'sassc-rails'
gem 'sprockets-rails'
gem 'stimulus-rails'

group :development, :test do
  gem 'byebug'
  gem 'database_cleaner'
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'parallel'
  gem 'rspec-benchmark'
  gem 'rspec-rails', '~> 5.0'
end

group :development, :linting do
  gem 'slim_lint'
end

group :development do
  gem 'lefthook'
  gem 'rubocop', require: false
  gem 'rubocop-graphql', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rake', require: false
  gem 'rubocop-rspec', require: false
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'parallel_tests'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

# Use Redis for Action Cable
gem 'redis', '~> 4.0'
