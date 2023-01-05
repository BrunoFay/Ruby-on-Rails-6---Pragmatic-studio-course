module MoviesHelper
  def isMovieFlop(movie)
    if movie.price < 120.000
      "flop!"
    else
      number_to_currency(movie.price,precision:0)
    end

  end

  def movie_year (movie)
    movie.released_on.strftime("%Y")

  end

end
