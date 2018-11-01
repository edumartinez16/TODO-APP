class UserMailer < ActionMailer::Base

  def welcome_email(user)
      @user = user
      mail(   :to      => @user.email,
              :subject => "Welcome"
      ) do |format|
        format.text
        format.html
      end
    end
  end

