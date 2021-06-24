class CommentsController < ApplicationController

  def index
    @shop = current_shop
    @comments = @shop.comments
  end

  def create
    @comment = Comment.new(comment_parms)
    if @comment.save
      flash[:notice] = "コメントを送信しました!"
      redirect_to shop_path(@comment.shop.id)
    else
      redirect_to shop_path(@comment.shop.id)
    end
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
