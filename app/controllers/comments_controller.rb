class CommentsController < ApplicationController
  def create
    article = Article.find(params[:article_id])
    comment = article.comments.new(permitted_params)
    if comment.valid? && comment.save
      redirect_to article
    else
      render json: {errors: comment.errors.full_messages}
    end
  end

  private
  def permitted_params
    params.require(:comment).permit(:author_name, :body)
  end
end
