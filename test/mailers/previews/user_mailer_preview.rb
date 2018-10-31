# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  user = User.find(1)

  mail = UsersMailer.welcome_email(user.id)
  #mail.deliver_now
  mail.deliver_later
end
