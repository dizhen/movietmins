require 'spec_helper'

describe "Movie pages" do

  subject { page }

  let (:movie) { FactoryGirl.create(:movie) }
  let (:user)  { FactoryGirl.create(:user) }

  describe "movie creation page" do
    before { visit new_movie_path }

    it { should have_content('Create a new movie') }
    it { should have_title(full_title('Create movie')) }
  end

  describe "movie creation" do
    before { visit new_movie_path }

    describe "with invalid information" do

      it "should not create a movie" do
        expect { click_button "Create new movie" }.not_to change(Movie, :count)
      end

      describe "error messages" do
        before { click_button "Create new movie" }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do

      before do
        fill_in "Name",         with: "Example"
        fill_in "Length",       with: "100"
        fill_in "Director",     with: "test"
        fill_in "Cast",         with: "test"
        fill_in "Genre",        with: "test"        
      end

      it "should create a movie" do
        expect { click_button "Create new movie" }.to change(Movie, :count).by(1)
      end
    end
  end

  describe "movie index" do
    before do
      sign_in user
      FactoryGirl.create(:movie, name: "test1", length: "100", director: "me", cast: "he", genre: "horror")
      FactoryGirl.create(:movie, name: "test2", length: "200", director: "me", cast: "he", genre: "animation")
      visit movies_path
    end

    it { should have_title('All movies') }
    it { should have_content('All movies') }

    it "should list each movie" do
      Movie.all.each do |movie|
        expect(page).to have_selector('li', text: movie.name)
      end
    end
  end

  describe "movie profile page" do
    let(:movie) { FactoryGirl.create(:movie) }
    let!(:r1) { FactoryGirl.create(:review, movie: movie, content: "good") }
    let!(:r2) { FactoryGirl.create(:review, movie: movie, content: "so so") }

    before { visit movie_path(movie) }

    it { should have_content(movie.name) }
    it { should have_title(movie.name) }

    describe "reviews" do
      it { should have_content(r1.content) }
      it { should have_content(r2.content) }
      it { should have_content(movie.reviews.count) }
    end
  end
end