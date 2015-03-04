# == Schema Information
#
# Table name: comments
#
#  id          :integer          not null, primary key
#  author_name :string
#  body        :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  article_id  :integer
#

class Comment < ActiveRecord::Base
  belongs_to :article, counter_cache: true

  # validation of presence of attributes
  validates :body, :author_name, presence: true

  # default scope for order comments
  default_scope -> { order(:id) }

end
