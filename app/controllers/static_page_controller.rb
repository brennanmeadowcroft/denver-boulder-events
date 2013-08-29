class StaticPageController < ApplicationController
	layout "public"
	
	def index
		@request = Request.new
		@suggestion = Suggestion.new
	end

	def faq
	end

	def sitemap
		respond_to do |format|
			format.xml
		end
	end
end
