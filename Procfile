web: bin/rails server -p $PORT -e $RAILS_ENV
createcartworker: bundle exec sidekiq -c 2
jwtdestroyworker: bundle exec sidekiq -c 2
telegrambotworker: bundle exec sidekiq -c 2
bot: ruby /app/services/telegram_bot.rb
