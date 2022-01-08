class Article < ApplicationRecord
	
	belongs_to :user
	has_and_belongs_to_many :categories, dependent: :destroy, join_table: 'articles_categories'
	has_rich_text :description
	has_many :comments, dependent: :destroy

	validates :user_id, presence: true 
	validates :title, presence: true, length:{ minimum: 3}
	validates :description, presence:true, length: { minimum: 10}
end