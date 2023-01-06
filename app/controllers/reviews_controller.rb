class ReviewsController < ApplicationController

  def index
    @film = Film.find(params[:film_id])
    @reviews = @film.reviews
  end
  
end
