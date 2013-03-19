class Iterations
	def initialize(api_key)
		@iterations = Artisan::get_iterations(api_key)
	end

	def get_all_project_iterations
		list_of_iterations = []
  	@iterations.each_with_index do |iteration, i|
  		list_of_iterations.push(iteration.attributes)
  	end
  	return list_of_iterations
	end

	def get_all_iterations_by_date_range(start_date, end_date)
		list_of_iterations = []
		@iterations.each_with_index do |iteration, i|
			if iteration_within_date_range?(iteration, start_date, end_date)
				list_of_iterations.push(iteration.attributes)
			end
		end
		return list_of_iterations
	end

	def iteration_within_date_range?(iteration, start_date, end_date)
		iteration_start_date = iteration.attributes.fetch(:start_date)
		iteration_finish_date = iteration.attributes.fetch(:finish_date)
		if (start_date..end_date).cover?(iteration_start_date) || (start_date..end_date).cover?(iteration_finish_date)
			true
		else
			false
		end
	end
end