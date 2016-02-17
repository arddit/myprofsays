class UsersController < ApplicationController
  def new
  end

  def index
  	@users = User.all
  end

  def show
  	@user = User.friendly.find(params[:id])
  end
end
