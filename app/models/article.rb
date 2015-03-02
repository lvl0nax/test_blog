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
  validates :title, :body, presence: true

  scope :most_commented, -> do
    order(comments_count: :desc)
    .select(:title, :id, :comments_count)
    .limit(10)
  end

  paginates_per 10

  def to_param
    "#{id}_#{title}"
  end
end
