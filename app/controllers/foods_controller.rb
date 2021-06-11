class FoodsController < ApplicationController

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_parms)
    @food.shop_id = current_shop.id
    @food.save
    redirect_to shop_path(current_shop)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def food_parms
     params.require(:food).permit(:food_name, :introduction, :food_image, :price, :shop_id)
  end
end
