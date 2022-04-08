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
    re = /'?(\w+(?:\s+\w+)*)'?\s+<?(\S+@[\w.-]+\.[a-zA-Z]{2,4}\b)/ #Regex to validate email
    re1 = /([^.]+)/  #REGEX to separate the dot and give back first and last name
    client_name = email.scan(re) do |name| #go through the name with the first REGEX and scan which returns the match
      name.gsub!(re1) #And with gsub! it returns the original instance with all ocurrences of the second pattern
    end
    client_name = client_name.split('.') #split the string into an array of substrings with the specified pattern
    self_name = client_name.join(' ') #join the string
    return self_name.titleize #return the string titleized, first letter in capitals
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
