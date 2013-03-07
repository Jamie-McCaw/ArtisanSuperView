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
end