class ListController < ApplicationController
	WEEK = 7

	def view
		@iterations = Tables.new.create_project_table
	end

	def week_picker
		start_date = params['date']
		end_date = get_end_date(start_date)
		render :json => { :start_date => start_date, :end_date => end_date }
	end

	def date_from_string(date)
		Date.strptime(date, "%Y-%m-%d")
	end

	def date_to_string(date)
		date.strftime("%Y-%m-%d")
	end

	def get_end_date(date)
		date_to_string(date_from_string(date) + WEEK)
	end
end
