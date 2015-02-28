class Comment < ActiveRecord::Base
  validates :body, :author_name, presence: true
end
