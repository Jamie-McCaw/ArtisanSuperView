class Stories
	def initialize(api_key, iteration_number) 
		@stories = Artisan::get_stories_by_iteration(api_key, iteration_number)
	end

  def get_craftsman_names
  	members = []
  	@stories.each_with_index do |story, i|
  		members.push(story.attributes[:assigned_user_name]) 
  	end
  	return members.uniq
  end
end