class CommentsController < ApplicationController
  def create
    article = Article.find(params[:article_id])
    if article.comments.create(permitted_params)
      redirect_to article
    else
      render json: {error: 'big error'}
    end
  end

  private
  def permitted_params
    params.require(:comment).permit(:author_name, :body)
  end
end
