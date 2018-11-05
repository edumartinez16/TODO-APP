# frozen_string_literal: true

# Controller for the application
class ApplicationMailer < ActionMailer::Base
  default from: 'pruebamailer123@gmail.com'
  layout 'mailer'

  def sample_email(user)
    @user = user
    mail(to: @user.email, subject: 'Sample Email')
  end
end
