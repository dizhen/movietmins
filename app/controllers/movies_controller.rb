class MoviesController < ApplicationController
  before_action :signed_in_user, only: [:index, :show, :edit, :update, :destroy]

  def new
  	@movie = Movie.new
  end

  def show
  	@movie = Movie.find(params[:id])
  end

  def index
  	 @movies = Movie.paginate(page: params[:page])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
  end

  def create
  	@movie = Movie.new(movie_params)
  	if @movie.save
      flash[:success] = "success!"
      redirect_to @movie
    else
      render 'new'
    end
  end

  def destory
  end

  private

    def movie_params
      params.require(:movie).permit(:name, :length, :director, :cast, :genre)
    end

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end
end
