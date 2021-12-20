class Category < ApplicationRecord

	has_and_belongs_to_many :articles, join_table: 'articles_categories'

	validates :name, presence: true, uniqueness:true, length:{ minimum: 3, maximum: 30 }
	
	def name_with_initial
	  "#{name}"
	end
end
