# frozen_string_literal: true

Devise.setup do |config|
  config.secret_key = Tsui.config[:devise][:pepper]
  config.mailer_sender = Tsui.config[:mailers_default_from]
  require 'devise/orm/active_record'
  config.authentication_keys = [:email]
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 12
  config.pepper = Tsui.config[:devise][:pepper]
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 6..128
  config.email_regexp = /\A[a-zA-Z0-9\+_.-]+@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/
  config.reset_password_within = 6.hours
  config.lock_strategy = :failed_attempts
  config.unlock_keys = [:email]
  config.unlock_strategy = :both
  config.unlock_in = 1.hour
  config.maximum_attempts = 5
  config.reset_password_keys = [:email]
  config.confirmation_keys = [:email]
  config.mailer = 'PostmanMailer'
  config.navigational_formats = []
end
