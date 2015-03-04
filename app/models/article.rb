# == Schema Information
#
# Table name: articles
#
#  id             :integer          not null, primary key
#  title          :string
#  body           :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  comments_count :integer          default("0")
#

class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy

  #validation for presence attributes
  validates :title, :body, presence: true

  # send notification emails after creating article
  after_commit :notify_about_article, on: :create

  # scope: Looking for the most commented articles
  scope :most_commented, -> do
    order(comments_count: :desc)
    .where('comments_count > 0')
    .select(:title, :id, :comments_count)
    .limit(10)
  end

  # articles count per page
  paginates_per 10

  # method for friendly url
  def to_param
    "#{id}_#{title}"
  end

  private

  def notify_about_article
    DeliveryService.start(self.id)
  end
end
