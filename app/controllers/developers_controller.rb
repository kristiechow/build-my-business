class DevelopersController < ApplicationController
  skip_before_action :ensure_current_user


  def index
    @developers = Developer.all
  end

  def show
    @developer = Developer.find(params[:id])
  end

  def new
    session[:registration_type] = 'Developer'
    @developer = Developer.new
  end

  def create
    @developer = Developer.new(developer_params)
    if @developer.save
      flash.notice = "You're in! Welcome."
      session[:user_id] = @developer.id
      redirect_to edit_developer_path(@developer)
    else
      render :new
    end
  end

  def edit
    @developer = Developer.find(params[:id])
  end

  def update
    @developer = Developer.find(params[:id])
    if @developer.update(developer_edit_params)
      flash.notice = "Update successful."
      redirect_to developer_path(@developer)
    else
      render :edit
    end
  end

  def destroy
    developer = Developer.find(params[:id])
    developer.destroy
    flash.notice = "User successfully deleted."
    redirect_to root_path
  end


  private

  def developer_params
    params.require(:developer).permit(:password, :password_confirmation, :first_name, :last_name, :uid, :avatar, :provider)
  end

  def developer_edit_params
    params.require(:developer).permit(:first_name, :last_name, :uid, :avatar, :provider, :description, :location, skill_ids:[])
  end

end
