module ProductsHelper
	def gravatar_for_product(product, options = { size: 50 })
		if !product.image_url.nil?
    gravatar_id = Digest::MD5::hexdigest(product.image_url)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: product.name, class: "gravatar")
  end
  end
end
