class Contact < ApplicationRecord
  validates :first_name, :last_name, presence: true

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  validates :message, presence: true, length: { maximum: Constant::MESSAGE_LENGTH }
end
