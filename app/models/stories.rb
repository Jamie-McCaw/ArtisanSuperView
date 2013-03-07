class Stories
	API_KEY = '1ad5b3db20aa'
	API_KEY2 = '3861c2d7561d'
	API_KEY3 = 'E810b7038a88'

	def initialize(iteration_number) 
		@stories = Artisan::get_stories_by_iteration(API_KEY, iteration_number)
	end

  def get_craftsman_names
  	members = []
  	@stories.each_with_index do |story, i|
  		members.push(story.attributes[:assigned_user_name]) 
  	end
  	return members.uniq
  end
end