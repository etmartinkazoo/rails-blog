source "https://rubygems.org"
ruby "3.4.5"
gem "bcrypt"
gem "bootsnap", require: false
gem "image_processing"
gem "importmap-rails"
gem "propshaft"
gem "puma"
gem "pundit"
gem "rails", "~> 8.1.0.beta1"
gem "solid_queue"
gem "sqlite3"
gem "stimulus-rails"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem 'lexxy'

group :development do
  gem "rubocop-rails-omakase", require: false
  gem "web-console"
end

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri windows ]
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
end
