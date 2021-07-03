class FoodsController < ApplicationController
 before_action :authenticate_shop!, except: [:show]
  def new
    @food = Food.new
  end

  def create
    food = Food.new(food_parms)
    food.shop_id = current_shop.id
    if food.save
       tags = Vision.get_image_data(food.food_image)
       tags.each do |tag|
        food.tags.create(name: tag)
       end
      redirect_to shop_path(current_shop)
    else
      render :new
    end
  end

  def show
    @food = Food.find(params[:id])
  end

  def edit
    @food = Food.find(params[:id])
  end

  def update
    food = Food.find(params[:id])
    if food.update(food_parms)
      redirect_to shop_path(current_shop)
    else
      render :edit
    end
  end

  def destroy
    food = Food.find(params[:id])
    food.destroy
    redirect_to shop_path(current_shop)
  end

  private

  def food_parms
     params.require(:food).permit(:food_name, :introduction, :food_image, :price, :shop_id)
  end
end
