class Review < ActiveRecord::Base
	belongs_to :movie
	default_scope -> { order('created_at DESC') }
	validates :content, presence: true, length: { maximum: 300 }
	validates :movie_id, presence: true
end
