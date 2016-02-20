class DevelopersController < ApplicationController
  skip_before_action :ensure_current_user


  def index
    @developers = Developer.all
    # NEXT STEP - order by rating
  end

  def show
    @developer = Developer.find_by(id: params[:id])
  end

  def new
    @developer = Developer.new
  end

  def create
    @developer = Developer.new(developer_params)
    if @developer.save
      flash.notice = "You're in! Welcome."
      session[:user_id] = @developer.id
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @developer = Developer.find_by(id: params[:id])
  end

  def update
    @developer = Developer.find_by(id: params[:id])
    if @developer.update(developer_params)
      flash.notice = "Update successful."
      redirect_to developer_path(@developer)
    else
      render :edit
    end
  end

  def destroy
    developer = Developer.find_by(id: params[:id])
    developer.destroy
    flash.notice = "User successfully deleted."
    redirect_to root_path
  end


  private

  def developer_params
    params.require(:developer).permit(:password, :password_confirmation, :first_name, :last_name, :email, :avatar, :provider)
  end

end
