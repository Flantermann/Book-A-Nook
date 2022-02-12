class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

 def create
    @review = Review.new(space_params)
    @review.user = current_user
    # authorize @space
    if @review.save
      redirect_to space_path(@space), notice: "Your review has been successfully added"
    else
      render 'pages/home'
    end
  end

  def edit

  end

  private
    # only permit those attributes
    def review_params
      params.require(:review).permit(:rating, :comment)
    end
end
