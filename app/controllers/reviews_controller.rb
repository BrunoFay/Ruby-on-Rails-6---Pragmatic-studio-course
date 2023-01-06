class ReviewsController < ApplicationController

  before_action :set_movie

  def index
    @reviews = @movie.reviews
  end

  def new
    @review = @movie.reviews.new
  end

  def create
   @movie = Film.find(params[:film_id])
   @review = @movie.reviews.new(review_params)
    if @review.save
      redirect_to film_reviews_path(@movie), notice: "Thanks for your review!"
    else
      render :new
    end

  end

  private

    def set_movie
      @movie = Film.find(params[:film_id])
    end

    def review_params
      params.require(:review).permit(:name, :comment, :stars)
    end


end
