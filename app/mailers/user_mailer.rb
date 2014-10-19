class UserMailer < ActionMailer::Base
  default from: "ravin@menschly.com"

  def welcome_email(user)
    @user=user
    @url='http://stark-inlet-7537.herokuapp.com/meetings/show'
    mail(to: @user.email, subject: "Welcome to Entrepreneurship")
  end
end
