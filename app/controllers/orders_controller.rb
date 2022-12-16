class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index

  def index
  @item = Item.find(params[:item_id])
   @orders = Order.all
   @order_address = OrderAddress.new
  if current_user.id == @item.user.id || user_signed_in? && @item.order.present?
    redirect_to root_path
  end
end


  def new
    @order_address = OrderAddress.new
  end

  def create
   @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
    return redirect_to root_path
  else
   render :index
   end
end

  private

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
        Payjp::Charge.create(
         amount: @item.price,
          card: params[:token],  
          currency: 'jpy'        
        )
  end

  def order_params
    params.require(:order_address).permit(:item_id, :image, :post_code, :region_id, :city, :address, :building_name, :phone_num).merge(user_id: current_user.id, token: params[:token], item_id: @item.id)
  end
end

 