class ApplicationMailer < ActionMailer::Base
  default from: Tsui.config[:mailers_default_from]
  layout 'mailer'
end
