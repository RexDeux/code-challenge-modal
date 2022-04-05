require 'mail'

api_key = "7b81b9d0a96d4264b5c3bf9778e0f887"
class Invite < ApplicationRecord
  belongs_to :cycle
  validates_presence_of :name, :email
  validates_length_of :name, :email, maximum: 150
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP
  before_validation :email , :
  after_validation :bounced, :client_name
  #Using abstract's API to validate an email address || It queries the DNS servers to confirm it's existence

  def email
    name = first_name + last_name
    email_field = Mail::Address.new(self.email)
    self.email = email_field.address
    self.name = email_field.display_name
    self.first_name = email_field.local
  end

  def client_name
    name = invite_params[:name]
  def bounced
    @mail = Mail.read('/path/to/bounce_message.eml')
    if @mail.bounced
      print('The destination email seems to be inactive')
    else
      print('Your message was sent')
    end
  end
end
