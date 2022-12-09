class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_tweet, only: [:edit, :show, :update]
  before_action :move_to_index, except: [:index, :show]

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
    if unless current_user.id == @item.user_id
      redirect_to root_path
    end
  end
end

  def update
  if @item.update(item_params)
    redirect_to item_path
  else
    render :edit
  end
end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :detail_category_id, :detail_commodity_condition_id, :delivery_burden_id, :region_id, :days_to_ship_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_tweet
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end

