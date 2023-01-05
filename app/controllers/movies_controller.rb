class MoviesController < ApplicationController
    def index
      @name = "bruno fay"
      @age = rand(100)
      @favorite_movies = Film.all
    end
    def show
      @movie = Film.find(params[:id])
    end
end
