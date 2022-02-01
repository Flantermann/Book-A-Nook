class SpacesController < ApplicationController
  def index
    @spaces = policy_scope(Space)
  end

  def new
    @space = Space.new
    authorize @space
  end

  def create
    @space = Space.new(space_params)
    @space.user = current_user
    authorize @space
    if @space.save
      redirect_to space_path(@space), notice: "Reading space was successfully created"
    else
      render :new
    end
  end

  def show
    authorize @space
  end

  private

  def space_params
    params.require(:space).permit(:title, :description, :category, :address, :price_per_hour)
  end
end
