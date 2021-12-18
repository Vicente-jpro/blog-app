class Article < ApplicationRecord
	belongs_to :user
	validates :user_id, presence: true 
	has_many :article_categories
	has_many :categories, through: :article_categories
	validates :title, presence: true, length:{ minimum: 3}
	validates :description, presence:true, length: { minimum: 10, maximum:200 }
end