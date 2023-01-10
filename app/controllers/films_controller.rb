class FilmsController < ApplicationController
  before_action :require_signin, except: [:index,:show]
  before_action :require_admin, except: [:index, :show]

    def index
      @favorite_movies = Film.released
    end

    def show
      @movie = Film.find(params[:id])
    end

    def edit
      @movie = Film.find(params[:id])
    end

    def update
      @movie = Film.find(params[:id])

      if @movie.update(movie_params)
        redirect_to @movie
      else
        render :update, notice: "Movie successfully updated!"
      end

    end

    def new
      @movie = Film.new
    end

    def create
     @movie = Film.new(movie_params)

     if @movie.save
        redirect_to @movie, notice: "Movie successfully created!"
     else
        render :new
     end

    end

    def destroy
      @movie = Film.find(params[:id])
      @movie.destroy

      redirect_to films_url, alert:  "Movie successfully deleted!"
    end

  end

  private
    def movie_params
      params
      .require(:film)
      .permit(
          :name,
          :description,
          :price,
          :rating,
          :released_on,
          :duration,
          :director,
          :image_file_name
          )
    end


