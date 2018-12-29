# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gem "sinatra", "~> 2.0"

gem "timecop", "~> 0.9.1"

gem "pry", "~> 0.12.2"

gem "orderly", "~> 0.0.3"

gem "data_mapper", "~> 1.0"

gem "dm-postgres-adapter", "~> 1.0"

gem "rake", "~> 12.3"

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'rspec'
  gem 'rubocop', '0.56.0'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
end
