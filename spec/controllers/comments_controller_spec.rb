require 'spec_helper'
describe CommentsController do
  let!(:article) { Article.make! }
  describe 'POST create' do
    it 'should create new comment for the article' do
      expect{
        get :create, { article_id: article.id, body: 'test', author_name: 'tester' }
      }.to change(Comment, :count).by(1)
    end
  end
end
