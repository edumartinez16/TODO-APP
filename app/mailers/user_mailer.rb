# frozen_string_literal: true

# Class for the mailer
class UserMailer < ActionMailer::Base
  # Function to set the information of the mail
  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
