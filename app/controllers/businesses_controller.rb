class BusinessesController < ApplicationController
  def index
    if params[:search]
      @businesses = Business.search(params[:search])
    else
      @businesses = Business.all
    end
  end

  def new
    @business = Business.new
  end

  def create
    @business = Business.new(business_params)
    @categories = params[:categories].split(",").map {|category| category.strip}

    if @business.save
      @categories.each do |skill|
        @business.categories << Category.find_or_create_by(name: category)
      end
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
    @owner = @business.owner
    @hash = Gmaps4rails.build_markers(@business) do |business, marker|
     marker.lat business.latitude
     marker.lng business.longitude
     marker.infowindow business.name
     marker.json({name: business.name})
    end
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
