class ArchivesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  #before_action :archive_order_params, only: [:index]
  
  def index
    @item = Item.find(params[:item_id])
    @archive = Archive.new
  end

  def create
    @archive_order = Archive.new(archive_order_params)
    if @archive_order.valid?
      @archive_order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def archive_order_params
    params.require(archive_order).permit(:shipment_source_id,:city,:postal,:address,:building,:phone_number,:record).merge(user_id:current_user.id, item_id:params[:item_id],token:params[:token])
  end


  # def move_to_top
  #   redirect_to root_path if current_user.id != @item.user_id
  # end

end