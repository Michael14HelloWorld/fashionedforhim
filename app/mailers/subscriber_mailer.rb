class SubscriberMailer < ApplicationMailer
    default from: "fashionedforhim40@gmail.com"
    layout 'mailer'
  
    def welcome_email(subscriber)
      @subscriber = subscriber
      @url  = 'http://fashionedforhim.com'
      mail(to: @subscriber.email, subject: 'Thanks for Subscribing!')
    end
end
