class AddReferenceArticleComment < ActiveRecord::Migration
  def change
    add_reference :comments, :article
  end
end
