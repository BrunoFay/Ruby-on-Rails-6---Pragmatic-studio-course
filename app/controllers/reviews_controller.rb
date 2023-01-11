class ReviewsController < ApplicationController
  before_action :require_signin
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
   @review.user = current_user

    if @review.save
      redirect_to film_reviews_path(@movie), notice: "Thanks for your review!"
    else
      render :new
    end

  end

  private

    def set_movie
      @movie = Film.find_by!(slug: params[:film_id])
    end

    def review_params
      params.require(:review).permit(:comment, :stars)
    end


end
