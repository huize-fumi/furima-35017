class ItemsController < ApplicationController
  
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    unless user_signed_in?
      redirect_to '/users/sign_in'
    end
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:image,:product_name,:description,:categories_id,:status_id,:delivery_fee_id,:shipment_source_id,:days_id,:price).merge(user_id: current_user.id)
  end


end
