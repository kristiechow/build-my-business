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
    session[:registration_type] = 'Developer'
    @developer = Developer.new
  end

  def create
    @developer = Developer.new(developer_params)
    @skills = params[:skills].split(",").map {|skill| skill.strip}
    if @developer.save
      @skills.each do |skill|
        @developer.skills << Skill.find_or_create_by(name: skill)
      end
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
    params.require(:developer).permit(:password, :password_confirmation, :first_name, :last_name, :uid, :avatar, :provider)
  end

end
