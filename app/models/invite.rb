class Invite < ApplicationRecord
  belongs_to :cycle
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
