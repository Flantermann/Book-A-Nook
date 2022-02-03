class SpacesController < ApplicationController
  before_action :set_space, only: [:show, :edit, :update, :destroy]
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
  end

<<<<<<< HEAD
=======
  def edit
  end

  def update
    if @space.update(space_params)
      redirect_to @space, notice: "Reading space was successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @space.destroy
    redirect_to root_path, notice: "Reading space was successfully deleted"
  end

>>>>>>> 5db6761e8ed1380db58d254dc53e3916870d23c5
  private

  def space_params
    params.require(:space).permit(:title, :description, :category, :address, :price_per_hour, :photos)
  end

   def set_space
    @space = Space.find(params[:id])
    authorize @space
  end
end
