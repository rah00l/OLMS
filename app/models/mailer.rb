class Mailer < ActionMailer::Base
    def contact(recipient, subject, message, sent_at = Time.now)
      #puts "hey inside test"
      #from "your name <your_login@your_domain.com>"
      #recipients ["your_login@your_domain.com"]
      #subject "working?"
      #body "sending from rails"
      
      
      @subject = subject
      @recipients = recipient
      @from = 'aplabsprylogic@gmail.com'
      @sent_on = sent_at
      @body["title"] = 'Online Library System'
  	  @body["email"] = 'aplabsprylogic@gmail.com'
   	  @body["message"] = message
      @headers = {}
    end
  end
