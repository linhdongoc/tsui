source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'bootsnap',                                       '>= 1.4.2', require: false
gem 'nori'
gem 'pg',                                             '>= 0.18', '< 2.0'
gem 'puma',                                           '~> 4.3'
gem 'rack-cors',                                      require: 'rack/cors'
gem 'rails',                                          '~> 6.0'
gem 'graphql',                                        '~> 1.9'
gem 'redis',                                          '~> 4.1', '>= 4.1.3'
gem 'bcrypt',                                         '~> 3.1', '>= 3.1.13'
gem 'jwt_sessions',                                   '~> 2.4', '>= 2.4.3'
gem 'active_model_serializers'
gem 'ffaker'
gem 'factory_bot_rails'

group :development, :test do
  gem 'byebug'
  gem 'rubocop',                                      require: false
  gem 'rubocop-rails'
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
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'rubocop-rspec',                                require: false
  gem 'rspec-graphql_matchers'
  gem 'hashdiff',                                     ['>= 1.0.0.beta1', '< 2.0.0']
  gem 'simplecov',                                    require: false
end
