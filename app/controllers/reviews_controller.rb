class ReviewsController < ApplicationController
  before_action :set_restaurant, only: [:new, :create, :destroy]

  def new
    @review = Review.new
  end

  def create
    @review = @restaurant.reviews.build(review_params)
    if @review.save
      redirect_to @restaurant
    else
      render :new
    end
  end

  def destroy
    @review.destroy
    redirect_to @restaurant
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
