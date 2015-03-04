class DeliveryService
  def self.start(article_id)
    Subscription.ids.each do |sub_id|
      # delivery_later - Rails 4.2 method which will send emails asynchronously
      # (your emails send in a background job)
      NotificationMailer.notify(sub_id, article_id).deliver_later
    end
  end
end
