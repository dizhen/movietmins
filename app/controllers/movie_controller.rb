class MovieController < ApplicationController
  def new
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def index
  	@movie = Movie.all
  end
end
