source 'https://rubygems.org'

ruby '2.2.1'

gem 'activeadmin', github: 'activeadmin'
gem 'delayed_job_active_record', '~> 4.0.3'
gem 'devise'
gem 'inherited_resources', github: 'josevalim/inherited_resources', branch: 'rails-4-2'
gem 'pg'
gem 'rails', '4.2.0'
gem 'unicorn'

group :assets do
  gem 'coffee-rails', '~> 4.1.0'
  gem 'sass-rails',   '~> 5.0.1'
  gem 'uglifier'
end

# group :development do
#   gem 'pry'
#   gem 'sqlite3'
# end

group :development, :test do
  gem "dotenv-rails"
end

group :production do
  gem 'rails_12factor'
  gem 'rails_serve_static_assets'
end

# gem "sendgrid"