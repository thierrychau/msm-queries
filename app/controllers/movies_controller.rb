class MoviesController < ApplicationController
  def index
    render({ :template => "movie_templates/list" })
  end

  def show
    movie_id = params.fetch("movie_id")
    @the_movie = Movie.where({ :id => movie_id }).at(0)

    render({ :template => "movie_templates/details" })
  end
end
