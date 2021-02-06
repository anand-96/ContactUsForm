class EmailWorker
  include Sidekiq::Worker

  def perform(method_name, email, message, delivery)
    ContactMailer.send(method_name.to_sym, email, message).send(delivery.to_sym)
  end
end
