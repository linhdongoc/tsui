require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Tsui
  class << self
    attr_accessor :config
  end

  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    config.time_zone = 'Berlin'
    config.i18n.default_locale = :de
    config.i18n.available_locales = %i[de en]
    config.i18n.fallbacks = [I18n.default_locale]

    config.api_only = true

    config.before_configuration do
      config = YAML.safe_load(ERB.new(File.read(Rails.root.join('config', 'application.yml'))).result, [], [], true).deep_symbolize_keys[Rails.env.to_sym]
      Tsui.config = config
    end
  end
end
