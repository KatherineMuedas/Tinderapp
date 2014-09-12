class ProfilesController < ApplicationController
  def index
    @profiles = Profile.all
  end

  def create
     @profile = Profile.new(profile_params)
   
    if @profile.save
      redirect_to @profile
    else
      render 'new'
    end
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      redirect_to @profile
    else
      render :edit, notice: "failure"
    end
  end

  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy
    redirect_to profiles_path
  end

  def edit
   @profile = Profile.find(params[:id])
  end

  def new
    @profile = Profile.new
  end

  def show
    @profile = Profile.find(params[:id])
  end

  private

  def profile_params
    params.require(:profile).permit(:about, :birthdate, :gender)
  end
end
