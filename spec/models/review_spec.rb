require 'spec_helper'

describe Review do
  let(:movie) { FactoryGirl.create(:movie) }
  before do
    # This code is not idiomatically correct.
    @review = Review.new(content: "Sucks!", movie_id: movie.id)
  end

  subject { @review }

  it { should respond_to(:content) }
  it { should respond_to(:movie_id) }
  it { should respond_to(:movie) }
  its(:movie) { should eq movie }

  it { should be_valid }

  describe "when movie_id is not present" do
    before { @review.movie_id = nil }
    it { should_not be_valid }
  end

  describe "with blank content" do
    before { @review.content = " " }
    it { should_not be_valid }
  end

  describe "with content that is too long" do
    before { @review.content = "a" * 310 }
    it { should_not be_valid }
  end
end
