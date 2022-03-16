module ApplicationHelper
	def gravatar_for(user, options = { size: 200 })
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		size = options[:size]
		gravatar_url = "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
		image_tag(gravatar_url, alt: user.username, class: "img-circle")
	end
end
