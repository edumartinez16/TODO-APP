class ApplicationMailer < ActionMailer::Base
  default from: 'pruebamailer123@gmail.com'
  layout "mailer"

  def sample_email(user)
    @user = user
    mail(to: @user.email, subject: 'Sample Email')
  end

end
 
# app/mailers/user_mailer.rb
# class UserMailer < ApplicationMailer
  
# end