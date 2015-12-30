class UserMailer < ApplicationMailer
   default from: "isitheavierthanair@gmail.com"
   
   def contact_form(email, name, message)
      @message = message
      mail(:from => email,
         :to => "isitheavierthanair@gmail.com",
         :subject => "A new contact form message from #{name}")
   end
end
