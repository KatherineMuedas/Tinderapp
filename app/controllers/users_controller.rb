class UsersController < ApplicationController
  before_action :set_user, only: [ :show, :edit, :update, :destroy]
  
  def new
    @user = User.new
  
  end
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: 'Your user has been created successfully.'
    else
      render :new
    end
  end

  def show

  end
  
  def edit

  end

  def update
   if @user.update(user_params)
      redirect_to @user, notice: 'Your changes were successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to user_url, notice: 'Project was successfully deleted.'
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
