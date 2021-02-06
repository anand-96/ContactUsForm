class Contact < ApplicationRecord
  validates :first_name, :last_name, presence: true

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  validates :message, presence: true, length: { maximum: Constant::MESSAGE_LENGTH }

  after_create :send_message

  private
  def send_message
    EmailWorker.perform_async(:send_message, email, message, :deliver_later)
  end
end
