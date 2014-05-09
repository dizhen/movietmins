class MoviesController < ApplicationController
  before_action :signed_in_user, only: [:index, :show, :edit, :update]
  before_action :admin_user,     only: [:destroy]

  def new
  	@movie = Movie.new
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

  def show
  	@movie = Movie.find(params[:id])
    @reviews = @movie.reviews.paginate(page: params[:page])
    @review = @movie.reviews.build if signed_in?
  end

  def index
  	 @movies = Movie.paginate(page: params[:page])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
  end

  def destroy
    Movie.find(params[:id]).destroy
    flash[:success] = "Movie deleted."
    redirect_to movies_url   
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

    def signed_in?
      !current_user.nil?
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
