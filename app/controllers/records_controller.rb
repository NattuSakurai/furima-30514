class RecordsController < ApplicationController
  def index
    @user_shopping = UserShopping.new
    @item = Item.find(params[:item_id])
  end
  def create
    @user_shopping = UserShopping.new(shopping_params)
    @item = Item.find(params[:item_id])
    if @user_shopping.valid?
      pay_item
      @user_shopping.save
      redirect_to root_path
    else
      render :index
    end
  end
  private
  def shopping_params
    params.require(:user_shopping).permit(:postal_code, :prefectures_id, :city, :address_number, :building_name, :phone_number, :record_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token] )
  end
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
      Payjp::Charge.create(
        amount:  Item.find(params[:item_id]).price,  # 商品の値段
        card: shopping_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end
end
