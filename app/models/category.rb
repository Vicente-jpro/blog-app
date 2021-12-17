class Category < ApplicationRecord
	validates :name, presence: true, uniqueness:true, length:{ minimum: 3, maximum: 30 }
	has_many :article_categories
	has_many :articles, through: :article_categories
end
