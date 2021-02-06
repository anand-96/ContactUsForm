class ContactMailer < ApplicationMailer
  def send_message(email, message)
    @body = t('mailer.contact.send_message.body', message: message)
    mail(from: email, to: Figaro.env.EMAIL_RECEIVER, subject: t('mailer.contact.send_message.subject'))
  end
end
