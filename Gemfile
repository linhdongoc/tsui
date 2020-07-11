source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'bootsnap',                                       '>= 1.1.0', require: false
gem 'nori'
gem 'pg',                                             '>= 0.18', '< 2.0'
gem 'puma',                                           '~> 3.12'
gem 'rack-cors'
gem 'rails',                                          '~> 6.0'
gem 'graphql',                                        '~> 1.9'
gem 'redis',                                          '~> 4.1', '>= 4.1.3'
gem 'bcrypt',                                         '~> 3.1', '>= 3.1.13'
gem 'jwt_sessions',                                   '~> 2.4', '>= 2.4.3'

group :development, :test do
  gem 'byebug'
  gem 'rubocop',                                      require: false
  gem 'rubocop-rails'
  gem 'faker'
  gem 'factory_bot_rails'
end

group :development do
  gem 'listen',                                       '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen',                        '~> 2.0.0'
  gem 'rb-readline'
  gem 'graphiql-rails'
end

group :test do
  gem 'database_cleaner'
  gem 'rspec-rails',                                  '~> 3.7', '>= 3.7.2'
  gem 'shoulda-matchers',                             '~> 3.1', '>= 3.1.2'
  gem 'rubocop-rspec',                                require: false
  gem 'rspec-graphql_matchers'
end
