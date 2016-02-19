class OwnersController < ApplicationController
  skip_before_action :ensure_current_user


  def index
    @owners = Owner.all
    # NEXT STEP - order by rating
  end

  def show
    @owner = Owner.find_by(id: params[:id])
  end

  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.new(owner_params)
    if @owner.save
      flash.notice = "You're in! Welcome."
      session[:owner_id] = @owner.id
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @owner = Owner.find_by(id: params[:id])
  end

  def update
    if @owner.update(owner_params)
      flash.notice = "Update successful."
      redirect_to owner_path(@owner)
    else
      render :edit
    end
  end

  def destroy
    owner = Owner.find_by(id: params[:id])
    owner.destroy
    flash.notice = "Owner successfully deleted."
    redirect_to root_path
  end


  private

  def owner_params
    params.require(:owner).permit(:password, :password_confirmation, :first_name, :last_name, :email)
  end

end