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

  def average_stars(movie)
    if movie.average_stars.zero?
      content_tag(:strong, "No reviews")
    else
      pluralize(number_with_precision(movie.average_stars, precision: 1) , "star")
    end
  end

  def average_stars_as_percent
    (self.average_stars / 5.0) * 100
  end

end
