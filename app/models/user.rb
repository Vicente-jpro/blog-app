class User < ApplicationRecord
	
	has_many :articles
	before_save { self.email = email.downcase }

	validates :name, presence: true, length:{ minimum: 3, maximum:25 }
	validates :email, presence: true, 
	
			  uniqueness: { 
			  	scope: :name, 
			  	message: "Este email já exite"
			  } 

end
