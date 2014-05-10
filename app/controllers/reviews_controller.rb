class ReviewsController < ApplicationController
  before_action :signed_in_user

  def create
    @review = current_movie.reviews.build(review_params)
    if @review.save
      flash[:success] = "Review posted!"
      redirect_to movie_path(@current_movie)
    else
      flash.now[:error] = "Error! Failed to create review."
      @movies = Movie.paginate(page: params[:page])
      render 'static_pages/home'
    end
  end

  def destroy
  end

  private

    def review_params
      params.require(:review).permit(:content)
    end

    def current_movie
      @current_movie = Movie.find_by(params[:id])
    end

    def current_movie=(movie)
      @current_movie = movie
    end

end