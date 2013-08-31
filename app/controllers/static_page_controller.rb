class StaticPageController < ApplicationController
	layout "public"
	before_filter :signed_in_user, only: [ :dashboard ]
	
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

	def dashboard
		@events = Event.all
		@requests = Request.all

		events_by_month = Event.events_by_month
		events_by_month_data = GoogleVisualr::DataTable.new		
		events_by_month_data.new_column('string', 'Event Date' ) 
		events_by_month_data.new_column('number', 'Total Records') 
		events_by_month_data.add_rows(events_by_month)
		events_by_month_option = { title: 'Total Events By Month',
					vAxis: {title: 'Tag',  titleTextStyle: {color: 'red'}},
					hAxis: {showTextEvery: 1},
					backgroundColor: '#ECF0F1',
					legend: {position: 'none'},
					height: 200 }
		@events_by_month_chart = GoogleVisualr::Interactive::ColumnChart.new(events_by_month_data, events_by_month_option)

		events_by_tag = Tag.events_by_tag
		events_by_tag_data = GoogleVisualr::DataTable.new		
		events_by_tag_data.new_column('string', 'Tag' ) 
		events_by_tag_data.new_column('number', 'Total Records') 
		events_by_tag_data.add_rows(events_by_tag)
		events_by_tag_option = { title: 'Events By Tag',
					vAxis: {title: 'Tag',  titleTextStyle: {color: 'red'}},
					backgroundColor: '#ECF0F1',
					legend: {position: 'none'},
					height: 200 }
		@events_by_tag_chart = GoogleVisualr::Interactive::ColumnChart.new(events_by_tag_data, events_by_tag_option)

		requests_by_day = Request.requests_by_day
		requests_by_day_data = GoogleVisualr::DataTable.new		
		requests_by_day_data.new_column('string', 'Created' ) 
		requests_by_day_data.new_column('number', 'Total Events') 
		requests_by_day_data.add_rows(requests_by_day)
		requests_by_day_option = { title: 'Requests Per Day',
					vAxis: {title: 'Tag',  titleTextStyle: {color: 'red'}},
					backgroundColor: '#ECF0F1',
					legend: {position: 'none'},
					height: 200 }
		@requests_by_day_chart = GoogleVisualr::Interactive::LineChart.new(requests_by_day_data, requests_by_day_option)

		cumul_requests_by_day = Request.cumul_requests_by_day
		cumul_requests_by_day_data = GoogleVisualr::DataTable.new		
		cumul_requests_by_day_data.new_column('string', 'Created' ) 
		cumul_requests_by_day_data.new_column('number', 'Running Total') 
		cumul_requests_by_day_data.add_rows(cumul_requests_by_day)
		cumul_requests_by_day_option = { title: 'Cumulative Requests Per Day',
					vAxis: {title: 'Tag',  titleTextStyle: {color: 'red'}},
					backgroundColor: '#ECF0F1',
					legend: {position: 'none'},
					height: 200 }
		@cumul_requests_by_day_chart = GoogleVisualr::Interactive::AreaChart.new(cumul_requests_by_day_data, cumul_requests_by_day_option)

		request_validations = Request.request_validations
		request_validations_data = GoogleVisualr::DataTable.new	
		request_validations_data.new_column('string', 'Type' ) 
		request_validations_data.new_column('number', 'Requests' ) 
		request_validations_data.new_column('number', 'Validations') 
		request_validations_data.add_rows(request_validations)
		request_validations_option = { title: 'Requests vs. Validations',
					vAxis: {minValue: 0},
					backgroundColor: '#ECF0F1',
					legend: {position: 'bottom'},
					height: 200 }
		@request_validations_chart = GoogleVisualr::Interactive::ColumnChart.new(request_validations_data, request_validations_option)

		respond_to do |format|
			format.html { render :layout => "backend" }
		end
	end
end
