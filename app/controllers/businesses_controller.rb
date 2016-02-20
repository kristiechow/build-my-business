class BusinessesController < ApplicationController
  def index
    @businesses = Business.all
  end

  def new
    @business = Business.new
  end

  def create
    @business = Business.new(business_params)

    if @business.save
      if params[:images]
        params[:images].each do |image|
          @business.photos.create(image: image)
        end
      end
      session[:business_id] = @business.id
      redirect_to business_path(@business)
    else
      render :new
    end
  end

  def show
    @business = Business.find(params[:id])
  end

  def edit
    @business = Business.find_by(id: params[:id])
  end

  def update
    @business = Business.find_by(id: params[:id])
    if @business.update(business_params)
      flash.notice = "Update successful."
      redirect_to business_path(@business)
    else
      render :edit
    end
  end

  def destroy
    business = Business.find_by(id: params[:id])
    business.destroy
    flash.notice = "User successfully deleted."
    redirect_to root_path
  end

  private


    def business_params
      params.require(:business).permit(:name, :description, :location).merge(owner_id: current_user.id)
    end
end
