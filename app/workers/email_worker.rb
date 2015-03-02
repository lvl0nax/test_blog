class EmailWorker
  include Sidekiq::Worker

  def perform
    Subscription.each do |s|

    end
  end
end
