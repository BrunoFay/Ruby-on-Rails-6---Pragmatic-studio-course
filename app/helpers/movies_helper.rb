module MoviesHelper
  def isMovieFlop(movie)
    if movie.price < 120.000
      "flop!"
    else
      number_to_currency(movie.price,precision:0)
    end

  end

  def movie_year(movie)
    movie.released_on.strftime("%Y")

  end

  def main_image(movie)
    if movie.main_image.attached?
      image_tag movie.main_image.variant(resize_to_limit: [150, nil])
    else
      image_tag "placeholder.png"
    end
  end

  def nav_link_to(text, url)
    if current_page?(url)
      link_to(text,url,class:"active")
    else
      link_to(text,url)
    end

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
