class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @shop = Shop.find(params[:id])
    @comment.save
    redirect_back(fallback_location: shop_path(@shop.id))
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :shop_id)
  end

end
