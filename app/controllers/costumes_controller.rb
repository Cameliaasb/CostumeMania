require 'algolia'

class CostumesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_costume, only: %i[edit update destroy]

  def index
    # Only costumes that are not owned by user are displayed in index (user cannot book his own costumes)
    @costumes = Costume.where.not(owner: current_user)

    # Params are sent via search_controller.js through the filter form
    if params[:gender].present?
      # Unisex products are displayed for both genders
      # Actioned when Category filter is checked
      @costumes = @costumes.where(gender: params[:gender]).or(@costumes.where(gender: "unisex"))
    end
    if params[:condition].present?
      # Actioned when Condition filter is checked
      @costumes = @costumes.where(condition: params[:condition])
    end

    if params[:price].present?
      # Actioned when Price filter input not empty.
      # URL => ...&price=[3,6]... : costumes.where(price: 3..6)
      price_range = params[:price].tr("[]", "").split(',').map(&:to_i)
      @costumes = @costumes.where(price: price_range[0]..price_range[1])
    end

    # Keyword search powered by Algolia to permit typos
    @costumes = @costumes.search(params[:keyword]) if params[:keyword].present?

    if params[:size].present?
      # Actioned when Size filter is checked. For example: if S & M are checked
      # URL => ...&size=[S,M]... : Params[:size].scan(/\w+/) ==> ["S", "M"]
      @costumes = @costumes.select { |costume| params[:size].scan(/\w+/).include?(costume.size) }
    end
  end

  def show
    @costume = Costume.find(params[:id])
    @booking = Booking.new
  end

  def new
    # user if logged can create a new costume for others to rent
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
    # Costumes owned by current_user
    @costumes = Costume.where(owner: current_user)
  end

  private

  def costume_params
    params.require(:costume).permit(:photo, :size, :price, :condition, :name, :gender, :description)
  end

  def set_costume
    @costume = Costume.find(params[:id])
  end

  def owner?
    @costume = Costume.find(params[:id])
    @costume.owner == current_user
  end
end
