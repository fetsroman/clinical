class JwtDestroyWorker
  include Sidekiq::Worker

  def perform(id)
    JwtBlacklist.destroy(id)
  end
end