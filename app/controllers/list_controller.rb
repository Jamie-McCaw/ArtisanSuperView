class ListController < ApplicationController
	WEEK = 7

	def view
	end

	def create_table(start_date, end_date)
		@iterations = Tables.new.create_project_table_from_dates(start_date, end_date)
	end

	def week_picker
		start_date = params['date']
		end_date = get_end_date(start_date)
		create_table(start_date, end_date)
		render :json => {:iterations => @iterations}
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
