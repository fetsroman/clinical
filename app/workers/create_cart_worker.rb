class CreateCartWorker
  include Sidekiq::Worker

  def perform(user_id)
    Cart.create!(user_id: user_id)
  end
end