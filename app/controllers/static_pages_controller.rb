class StaticPagesController < ApplicationController
  def home
  	if signed_in?
  	  @movies = Movie.paginate(page: params[:page])
  	end
  end

  def help
  end

  def about
  end

  def contact
  end
end
