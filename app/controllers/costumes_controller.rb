require 'algolia'

class CostumesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  def index
    if params[:query]
      Costume.algolia_reindex!
      @costumes = Costume.algolia_search(params[:query])
    else
      @costumes = Costume.all
    end
  end

  def show
    @costume = Costume.find(params[:id])
    @booking = Booking.new
  end

  def new
    # Reste à faire : gérer les authorisation avec devise
    @costume = Costume.new
  end

  def create
    # attention ne marche pas si user non connecté, il faut gérer les authorisation avec devise
    costume = Costume.new(costume_params)
    costume.owner = current_user
    if costume.save
      redirect_to costume_path(costume)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def my_costumes
    # Reste à faire : gérer les authorisation avec devise
    @costumes = Costume.where(owner: "current_user")
  end

  private

  def costume_params
    params.require(:costume).permit(:photo, :size, :price, :condition, :name, :min_duration, :age, :gender, :description)
  end
end
