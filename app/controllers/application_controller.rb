class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :fetch_commented_articles
  private
  def fetch_commented_articles
    @commented_articles = Article.most_commented
  end
end
