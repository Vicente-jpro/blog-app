module ApplicationHelper
	def gravatar_image(email)
		gravatar_image_tag(email + ''.gsub('spam', 'mdeering'), alt: '' + email )
	end

	
end
