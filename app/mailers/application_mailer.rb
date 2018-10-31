class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout "mailer"

  def sample_email(user)
    @user = user
    mail(to: @user.email, subject: 'Sample Email')
  end

end
 
# app/mailers/user_mailer.rb
# class UserMailer < ApplicationMailer
  
# end