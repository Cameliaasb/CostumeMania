class CostumesController < ApplicationController
  def index
    @costumes = Costume.all
  end

  def show
    @costume = Costume.find(params[:id])
  end

  def new
    @costume = Costume.new
  end

  def create
    costume = Costume.new(costume_params)
    costume.owner = current_user
    if costume.save
      redirect_to costume_path(costume)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def my_costumes
    @costumes = Costume.where(owner: "current_user")
  end

  private

  def costume_params
    params.require(:costume).permit(:photo, :size, :price, :condition, :min_duration)
  end
end
