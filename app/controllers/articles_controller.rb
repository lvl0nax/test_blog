class ArticlesController < ApplicationController

  # before filter for fetching the most commented articles before index action
  before_action :fetch_commented_articles, only: :index

  def index
    @articles = Article.order(created_at: :desc).page params[:page]
  end

  def show
    @article = Article.includes(:comments).find(params[:id])
  end

  def about;  end


  private
  def fetch_commented_articles
    @commented_articles = Article.most_commented
  end
  def page_param
    params[:page] || 1
  end
end
