class NotificationMailer < ApplicationMailer
  def notify(subscription_id, article_id)
    @article = Article.find(article_id)
    @subscription = Subscription.find(subscription_id)
    mail to: @subscription.email,
         subject: 'MY_BLOG: new article'
  end
end
