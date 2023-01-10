module FavoritesHelper
  def fave_or_unfave_button(movie, favorite)
    if favorite
      button_to "♡ Unfave", film_favorite_path(movie, favorite), method: :delete
    else
      button_to "♥️ Fave", film_favorites_path(movie)
    end
  end
end
