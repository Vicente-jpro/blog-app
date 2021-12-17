class Article < ApplicationRecord
	belongs_to :user
	validates :user_id, presence: true 
	has_many :article_categories
	has_many :categories, through: :article_categories
end
