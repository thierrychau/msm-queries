class MoviesController < ApplicationController
  def index
    render({ :template => "movies_templates/list" })
  end

  def show
    the_id = params.fetch("the_id")
    @the_director = Director.where({ :id => the_id }).at(0)
    @the_filmography = Movie.where({ :director_id => the_id })

    render({ :template => "movies_templates/details" })
  end
end
