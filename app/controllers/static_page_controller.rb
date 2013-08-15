class StaticPageController < ApplicationController
	layout "public"
	
	def index
		@request = Request.new
	end

	def faq
	end
end
