class ProfessorsController < ApplicationController
	before_action :set_professor, only: [:show, :edit, :update, :destroy]

  def index
		@professor = Professor.all
  end

  def show
		@professor = Professor.friendly.find(params[:id])
  end

  def new
    @professor = Professor.new
  end

  def edit
    unless current_user.admin?
      redirect_to @professor 
      flash[:alert] = "You don't have permission to edit this professor."
    end
  end

  def create
    @professor = Professor.new(professor_params)

    respond_to do |format|
      if @professor.save
        format.html { redirect_to @professor, notice: 'professor was successfully created.' }
        format.json { render :show, status: :created, location: @professor }
      else
        format.html { render :new }
        format.json { render json: @professor.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @professor.update(professor_params)
        format.html { redirect_to @professor, notice: 'professor was successfully updated.' }
        format.json { render :show, status: :ok, location: @professor }
      else
        format.html { render :edit }
        format.json { render json: @professor.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @professor.destroy
    respond_to do |format|
      format.html { redirect_to professors_url, notice: 'professor was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_professor
      @professor = Professor.friendly.find(params[:id])
    end

    def professor_params
      params.require(:professor).permit(:name, :slug, :avatar)
    end
end
