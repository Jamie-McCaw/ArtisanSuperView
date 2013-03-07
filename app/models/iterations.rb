class Iterations
	API_KEY = '1ad5b3db20aa'
	API_KEY2 = '3861c2d7561d'
	API_KEY3 = 'E810b7038a88'

	def initialize
		@iterations = Artisan::get_iterations(API_KEY)
	end

	def get_all_project_iterations
		list_of_iterations = []
  	@iterations.each_with_index do |iteration, i|
  		list_of_iterations.push(iteration.attributes)
  	end
  	return list_of_iterations
	end
end