class MoviesController < ApplicationController
    def index
      @favorite_movies = Film.all
    end

    def show
      @movie = Film.find(params[:id])
    end

end
