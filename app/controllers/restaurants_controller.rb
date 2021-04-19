class RestaurantsController < ApplicationController
    before_action :findby_id, only: [:edit, :update, :destroy]
  def index
    @restaurants = Restaurant.all
  end

  def new
    if not session[:thankyou9527]
      redirect_to root_path
    else
      @restaurant = Restaurant.new
    end
  end

  def create
    @restaurant = Restaurant.new(params_clean)

    if @restaurant.save
      redirect_to restaurants_path, notice: "恭喜成功寫入"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @restaurant.update(params_clean)
      redirect_to restaurants_path, notice: "編輯成功"
    else
      render :edit
    end
  end

  def destroy
    if @restaurant
      @restaurant.destroy
    end
    
    redirect_to restaurants_path, notice: "刪除成功"
  end

  private
  def params_clean
    params.require(:restaurant).permit(:title, :address, :tel, :email, :description)
  end

  def findby_id
    @restaurant = Restaurant.find(params[:id])
  end

end