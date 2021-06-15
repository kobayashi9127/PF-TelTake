class Admins::ShopsController < ApplicationController
  def index
    @shops = Shop.search(params[:search])
  end
  def show
    @shop = Shop.find(params[:id])
  end

  def destroy
    shop = Shop.find(params[:id])
    shop.destroy
    redirect_to admins_shops_path
  end
end
