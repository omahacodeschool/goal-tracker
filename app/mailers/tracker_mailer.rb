class TrackerMailer < ActionMailer::Base
  # default from: 'notifications.gtracker@gmail.com'
  
  def welcome(user)
    @user = user
    
    mail(to: user.email, from: ENV['MAILER'], subject: "Welcome to G Tracker!")
  end
  
  def reminder(user)
    @user = user
    
    mail(to: user.email, from: ENV['MAILER'], subject: "Don't be a LOSER!")
  end
  
  
end
