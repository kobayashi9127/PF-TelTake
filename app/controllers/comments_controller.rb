class CommentsController < ApplicationController

  def index
    @shop = current_shop
    @comments = @shop.comments.order(created_at: :desc).page(params[:page]).per(10)
    # 新しい順に１０ずつ表示
    @notifications = current_shop.notifications
    @notifications.checked!
  end

  def create
    @shop = Shop.find(params[:shop_id])
    #投稿に紐づいたコメントを作成
    @comment = @shop.comments.new(comment_params)
    if @comment.save
      #通知の作成
      @shop.save_notification_comment!(@comment.id)
      flash[:notice] = "コメントを送信しました!"
      redirect_to shop_path(@comment.shop.id)
    else
      flash.now[:alert] = "文字を入力して下さい"
      redirect_to shop_path(@comment.shop.id)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :shop_id)
  end

end
