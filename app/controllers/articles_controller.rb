class ArticlesController < ApplicationController
  def index
    @articles = Article.order(created_at: :desc).page params[:page]
  end

  def show
    @article = Article.includes(:comments).find(params[:id])
  end

  def about;  end

  private
  def page_param
    params[:page] || 1
  end
end
