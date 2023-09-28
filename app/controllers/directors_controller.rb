class DirectorsController < ApplicationController
  def index
    render({ :template => "director_templates/list" })
  end

  def show
    the_id = params.fetch("the_id")
    @the_director = Director.where({ :id => the_id }).at(0)
    @the_filmography = Movie.where({ :director_id => the_id })

    render({ :template => "director_templates/details" })
  end

  def show_youngest
    @youngest_director = Director.order(:dob => :asc).where.not(:dob => nil).last

    render({ :template => "director_templates/youngest" })
  end

  def show_eldest
    @eldest_director = Director.order(:dob => :asc).where.not(:dob => nil).first

    render({ :template => "director_templates/eldest" })
  end
end
