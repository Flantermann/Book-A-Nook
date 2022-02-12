class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    # find method should be defiend private?
    @space = Space.find(params[:space_id])
    @review = Review.new(space_params)
    @review.user = current_user
    if @review.save
      redirect_to space_path(@space), notice: "Your review has been successfully added"
    else
      render 'pages/home'
    end
  end

  def show; end

  def edit; end

  def destroy
    @booking.destroy
    redirect_to dashboard_path
  end

  private
    # only permit those attributes
    def review_params
      params.require(:review).permit(:rating, :comment)
    end
end
