class StatusUpdatesController < ApplicationController

  def new
    @status_update = StatusUpdate.new
    @business = Business.find(params[:business_id])
  end

  def create
    @business = Business.find(params[:business_id])
    @status_update = StatusUpdate.new(status_update_params)
    if @status_update.save
      redirect_to business_path(@business)
    end
  end

  def edit
    @status_update = StatusUpdate.find_by(id: params[:id])
  end

  def update
    @status_update = StatusUpdate.find_by(id: params[:id])
    if @status_update.update(status_update_params)
      flash.notice = "Update successful."
      redirect_to business_path(@business)
    else
      render :edit
    end
  end

  def destroy
    @status_update = StatusUpdate.find_by(id: params[:id])
    @status_update.destroy
    flash.notice = "Update successfully deleted."
    redirect_to business_path(@business)
  end

  private

  def status_update_params
    params.require(:status_update).permit(:description, :percentage_revenue_increase, :business_id)
  end

end
