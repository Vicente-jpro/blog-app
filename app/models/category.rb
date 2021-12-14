class Category < ApplicationRecord
	validates :name, presence: true, uniqueness:true, length:{ minimum: 3, maximum: 30 }

end
