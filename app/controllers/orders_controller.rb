class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :move_to_top, only: [:index]
  
  def index
    @order = Order.new(order_params)
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.permit(:image, :product_name, :description, :category_id, :status_id, :delivery_fee_id, :shipment_source_id, :day_id, :price)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_top
    redirect_to root_path if current_user.id != @item.user_id
  end
  



end
