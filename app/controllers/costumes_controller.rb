require 'algolia'

class CostumesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_costume, only: %i[edit update destroy]

  def index
    @costumes = Costume.where.not(owner: current_user)
    if params[:gender].present?
      @costumes = @costumes.where(gender: params[:gender]).or(@costumes.where(gender: "unisex"))
    end
    @costumes = @costumes.search(params[:keyword]) if params[:keyword].present?
    if params[:size].present?
      @costumes = @costumes.select { |costume| params[:size].scan(/\w+/).include?(costume.size) }
    end
    if params[:price].present?
      @costumes = @costumes.select { |costume| eval(params[:price]).include?(costume.price) }
    end
  end

  def show
    @costume = Costume.find(params[:id])
    @booking = Booking.new
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

  def edit
  end

  def update
    @costume.update(costume_params)
    if @costume.save
      redirect_to costume_path(@costume)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @costume.destroy
    redirect_to costumes_path, status: :see_other
  end

  def my_costumes
    @costumes = Costume.where(owner: current_user)
  end

  private

  def costume_params
    params.require(:costume).permit(:photo, :size, :price, :condition, :name, :min_duration, :gender, :description)
  end

  def set_costume
    @costume = Costume.find(params[:id])
  end

  def owner?
    @costume = Costume.find(params[:id])
    @costume.owner == current_user
  end
end
