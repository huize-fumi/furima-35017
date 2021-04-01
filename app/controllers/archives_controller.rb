class ArchivesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :move_to_top, only: [:index, :create]

  def index
    @order_archive = OrderArchive.new
  end

  def create
    @order_archive = OrderArchive.new(order_archive_params)
    if @order_archive.valid?
      pay_item
      @order_archive.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_archive_params
    params.require(:order_archive).permit(:shipment_source_id, :city, :postal, :address, :building, :phone_number, :record).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_top
    redirect_to root_path if current_user.id == @item.user_id || @item.archive.present?
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_archive_params[:token],
      currency: 'jpy'
    )
  end
end
