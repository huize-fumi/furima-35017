class ArchivesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  # before_action :move_to_top, only: [:index]
  
  def index
    @archive = Archive.new(archive_params)
  end

  def create
    @archive = Archive.new(archive_params)
    if @archive.valid?
      @archive.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private
  def archive_params
    params.permit(:image, :product_name, :description, :category_id, :status_id, :delivery_fee_id, :shipment_source_id, :day_id, :price)
  end

  # def move_to_top
  #   redirect_to root_path if current_user.id != @item.user_id
  # end
  
end