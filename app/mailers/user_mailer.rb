class UserMailer < ActionMailer::Base
  default from: "ravin@menschly.com"

  def welcome_email(user)
    @user=user
    @url='localhost:3000/meetings/show'
    mail(to: @user.email, subject: "Welcome to Entrepreneurship")
  end
end
