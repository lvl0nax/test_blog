class CommentsController < ApplicationController
  def create
    article = Article.find(params[:article_id])
    comment = article.comments.new(permitted_params)
    if comment.valid? && comment.save
      render json: {status: :ok}
    else
      render json: {status: :error, errors: comment.errors.full_messages}
    end
  end

  private
  def permitted_params
    params.permit(:article_id, :author_name, :body)
  end
end
