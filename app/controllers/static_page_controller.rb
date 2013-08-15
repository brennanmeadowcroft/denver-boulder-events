class StaticPageController < ApplicationController
	layout "public"
	
	def index
		@request = Request.new
		@suggestion = Suggestion.new
	end

	def faq
	end
end
