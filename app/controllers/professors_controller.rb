class ProfessorsController < ApplicationController
	def new
  end

  def index
  	@prof = Professor.all
  end

  def show
  	@prof = Professor.find(params[:id])
  end
end
