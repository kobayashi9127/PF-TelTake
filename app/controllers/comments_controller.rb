class CommentsController < ApplicationController

  def index
    @shop = current_shop
    @comments = @shop.comments
  end

  def create
    @comment = Comment.new(comment_parms)
    @comment.save
    redirect_to shop_path(@comment.shop.id)
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
  end

  private
  def comment_parms
    params.require(:comment).permit(:body, :shop_id)
  end

end
