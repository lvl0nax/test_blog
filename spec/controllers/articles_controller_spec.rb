require 'spec_helper'
describe ArticlesController do
  describe 'GET show' do
    let(:article){ Article.make! }
    it 'assigns the requested meta info as @social_meta' do
      get :show, {:id => article.id}
      assigns(:article).should == article
    end
  end
  describe 'GET index' do
    let(:article1){ Article.make! }
    let(:article2){ Article.make! }
    it 'assigns the requested articles' do
      get :index
      assigns(:articles).should =~ [article1, article2]
    end
  end
end
