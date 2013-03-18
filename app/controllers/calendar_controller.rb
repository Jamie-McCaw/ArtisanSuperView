class CalendarController < ApplicationController
	def view
		@iterations = Tables.new.create_project_table
	end

	def get_events
		events = []
		view
		@iterations.each do |i|
			e = Event.new
			e.title = "Project: #{i[:project_name]}"
			e.number = "Iteration: #{i[:iteration_number]}"
			e.start_date = "Iteration start date: #{i[:start_date]}"
			e.end_date = "Iteration end date: #{i[:finish_date]}"
			e.start = "#{i[:start_date]}"
			e.end = "#{i[:finish_date]}"
			e.members = "Members of Iteration: #{i[:members].join(', ')}"
			e.completed = "Is iteration completed?: #{i[:iteration_completed?]}"
			e.backgroundColor = i[:iteration_completed?] == true ? "gray" : "steelblue"
			e.billed = "Billed Points: #{i[:billed_points]}"
			e.bugs = "Bug Points: #{i[:total_bug_points]}"
			e.completed_points = "Completed Points: #{i[:completed_points]}" 
			events.push(e)
		end
		render :json => events.to_json
	end
end
