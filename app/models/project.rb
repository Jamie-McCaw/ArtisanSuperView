class Project
	def initialize(api_key) 
		@project = Artisan::get_project(api_key)
	end

	def get_project_name
		@project.attributes.fetch(:name)
	end
end