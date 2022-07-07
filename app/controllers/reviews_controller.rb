class ReviewsController < ApplicationController
  before_action :set_Review, only: [:show, :edit, :update, :destroy]

  def index
    @review = Review.all
  end

  def show
    # @review = Review.find(params[:id])
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    # we need `restaurant_id` to associate review with corresponding restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end

    # @review = Review.new(review_params)

    # if @review.save
    #   redirect_to review_path(@review)
    # else
    #   render :new
    # end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def review_params
    params.require(:review).permit(:id, :rating, :content)
  end

  def set_review
    @review = Review.find(params[:id])
  end
end
