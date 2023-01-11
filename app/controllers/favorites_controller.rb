class FavoritesController < ApplicationController
  before_action :require_signin
  before_action :set_movie

  def create
    @movie = set_movie
    @movie.favorites.create!(user: current_user)

    # or append to the through association
    # @movie.fans << current_user

    redirect_to @movie
  end

  def destroy
    favorite = current_user.favorites.find(params[:id])
    favorite.destroy

    movie = set_movie
    redirect_to movie
  end


  private

  def set_movie
    @movie = Film.find_by!(slug: params[:film_id])
  end
end
