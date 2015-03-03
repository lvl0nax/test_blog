class EmailWorker
  include Sidekiq::Worker

  def perform(article_id)
    Subscription.ids.each do |s|
      NotificationMailer.notify(s, article_id)
    end
  end
end
