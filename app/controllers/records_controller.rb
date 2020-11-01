class RecordsController < ApplicationController
  def index
    @user_shopping = UserShopping.new
    @item = Item.find(params[:item_id])
  end
  def create
    @user_shopping = UserShopping.new(shopping_params)
    @item = Item.find(params[:item_id])
    if @user_shopping.valid?
      @user_shopping.save
      redirect_to root_path
    else
      render :index
    end
  end
  private
  def shopping_params
    params.permit(:postal_code, :prefectures_id, :city, :address_number, :building_name, :phone_number, :record_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
