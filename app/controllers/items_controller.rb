class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
    if user_signed_in? && current_user.id == @item.user_id 
      redirect_to item_path  unless current_user.id == @item.user_id
    else
      redirect_to root_path
    end
  end

  def update
    @item = Item.find(params[:id])
  if @item.update(item_params)
    redirect_to item_path
  else
    render :edit
  end
end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :detail_category_id, :detail_commodity_condition_id, :delivery_burden_id, :region_id, :days_to_ship_id, :price, :image).merge(user_id: current_user.id)
  end
end
