class UsersController < ApplicationController
  def new
  end

  def index
    unless can? :manage, @user
      redirect_to root_path
      flash[:alert] = "You don't have permission to view all users."
    end
  	@users = User.all
  end

  def show
  	@user = User.friendly.find(params[:id])
  end
end
