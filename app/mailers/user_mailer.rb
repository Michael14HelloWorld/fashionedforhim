class UserMailer < ApplicationMailer
    default from: 'fashionedforhim40@gmail.com'
 
    def welcome_email(user)
      @user = user
      @url  = 'http:fashionedforhim.com'
      mail(to: @user.email, subject: 'Thanks for Subscribing!')
    end
end
