class Project
	API_KEY = '1ad5b3db20aa'
	API_KEY2 = '3861c2d7561d'
	API_KEY3 = 'E810b7038a88'

	def initialize 
		@project = Artisan::get_project(API_KEY)
	end

	def get_project_name
		@project.attributes.fetch(:name)
	end
end