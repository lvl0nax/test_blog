class ArticlesController < ApplicationController
  def index
    @articles = Article.first(2)
  end
end
