require 'spec_helper'

describe Movie do

  before { @movie = Movie.new(name: "Example User", length: "123", director: "me", cast: "he", genre: "horror") }

  subject { @movie }

  it { should respond_to(:name) }
  it { should respond_to(:length) }
  it { should respond_to(:director) }
  it { should respond_to(:cast) }
  it { should respond_to(:genre) }
  it{ should  be_valid }
  
  describe "when name is not present" do
      before { @movie.name = " " }
      it { should_not be_valid }
    end
  
    describe "when name is already taken" do
        before do
          movie_with_same_name = @movie.dup
           movie_with_same_name.save
        end

        it { should_not be_valid }
      end
end