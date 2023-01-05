class MoviesController < ApplicationController
    def index
      @favorite_movies = Film.all
    end

    def show
      @movie = Film.find(params[:id])
    end

    def edit
      @movie = Film.find(params[:id])
    end

    def update
      @movie = Film.find(params[:id])

      movie_params=params
        .require(:film)
        .permit(:name, :description, :price, :rating, :released_on)

        @movie.update(movie_params)
        redirect_to @movie
    end
end
