require 'mail'
class Invite < ApplicationRecord
  belongs_to :cycle
  validates_presence_of :name, :email
  validates_length_of :name, :email, maximum: 150
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP
  before_validation :a_email
  #after_validation :bounced

  def a_email
    return if self.email.nil?
    email_field = Mail::Address.new(self.email)
    self.email = email_field.address
    self.name =  client_name(email_field.local)
    client_name(email_field.local) if self.name.nil?
  end

  def client_name(email)
    re = /'?(\w+(?:\s+\w+)*)'?\s+<?(\S+@[\w.-]+\.[a-zA-Z]{2,4}\b)/
    re1 = /([^.]+)/
    client_name = email.scan(re) do |name|
      name.gsub!(re1)
    end
    client_name = client_name.split('.')
    self_name = client_name.join(' ')
    return self_name.titleize
  end

  #def bounced
    #I wanted to make a method in case the email sending process failed due to DNS servers but since I don't know where the email will be saved this test will fail
    #@mail = Mail.read('/path/to/bounce_message.eml')
    #if @mail.bounced
      #print('The destination email seems to be inactive')
   # else
      #print('Your message was sent')
    #end
  #end
end
