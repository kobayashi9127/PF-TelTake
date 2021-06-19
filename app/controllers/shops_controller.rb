class ShopsController < ApplicationController
  def index
    @shops = Shop.search(params[:search],params[:genre_id]).page(params[:page]).reverse_order
  end

  def show
    @shop = Shop.find(params[:id])
    @foods = @shop.foods.all
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])
    if @shop.update(shop_params)
      redirect_to shop_path(current_shop)
    else
      redirect_to edit_shop_path(current_shop)
    end
  end

  def destroy
    shop = Shop.find(params[:id])
    shop.destroy
    redirect_to root_path
  end

  private

  def shop_params
    params.require(:shop).permit(:shop_name, :shop_image, :address, :phone_number, :holiday, :introduction, :opening_hours1, :opening_hours2, :genre_id)
  end

end
