class FilmsController < ApplicationController
  before_action :require_signin, except: [:index,:show]
  before_action :require_admin, except: [:index, :show]
  before_action :set_film, only: [:destroy,:show,:edit,:update]

    def index
      case params[:filter]
      when "upcoming"
        @favorite_movies = Film.upcoming
      when "recent"
        @favorite_movies = Film.recent
      when "hits"
        @favorite_movies = Film.hits
      when "flops"
        @favorite_movies = Film.flops
      else
        @favorite_movies = Film.released
      end

    end

    def show

      @genres = @movie.genres.order(:name)
      @fans = @movie.fans
      if current_user
        @favorite = current_user.favorites.find_by(film_id: @movie.id)
      end
    end

    def edit
    end

    def update

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
      @movie.destroy

      redirect_to films_url, alert:  "Movie successfully deleted!"
    end

  end

  private

  def set_film
    @movie = Film.find_by!(slug: params[:id])
  end

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
          :main_image,
          genre_ids: []
          )
    end


