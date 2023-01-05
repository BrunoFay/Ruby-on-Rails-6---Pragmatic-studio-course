class FilmsController < ApplicationController
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

        @movie.update(movie_params)
        redirect_to @movie
    end

    def new
      @movie = Film.new
    end

    def create
     movie = Film.create(movie_params)
      redirect_to movie
    end

    def destroy
      @movie = Film.find(params[:id])
      @movie.destroy

      redirect_to films_url
    end

  end

  private
    def movie_params
      params
      .require(:film)
      .permit(:name, :description, :price, :rating, :released_on)
    end


