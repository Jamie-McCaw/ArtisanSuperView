class ListController < ApplicationController
	API_KEY = '1ad5b3db20aa'
	API_KEY2 = '3861c2d7561d'
	API_KEY3 = 'E810b7038a88'
  
  def view
  	api_keys = [API_KEY, API_KEY2, API_KEY3]
  	projects = Array.new
  	api_keys.each do |api_key|
			project_name = Project.new(api_key).get_project_name
			project_iterations = Iterations.new(api_key).get_all_project_iterations
			projects.push(build_row_hash(project_iterations, project_name, api_key))
		end
		@iterations = projects.flatten
  end

  def build_row_hash(iterations, project_name, api_key)
  	table = Array.new
		iterations.each do |iteration|
			row = Hash.new
			row.store(:project_name, project_name)
			row.store(:iteration_number, iteration[:number])
			row.store(:members, get_names(api_key, iteration[:number]))
			row.store(:billed_points, iteration[:total_billed_points])
			if iteration[:committed_points_at_completion] != nil
				row.store(:total_bug_points, iteration[:committed_points_at_completion].to_f - iteration[:total_billed_points])
			else
				row.store(:total_bug_points, 0)
			end
			if iteration[:committed_points_at_completion] != nil
				row.store(:completed_points, iteration[:committed_points_at_completion])
			else
				row.store(:completed_points, 0)
			end
			row.store(:iteration_completed?, iteration[:complete])
			table.push(row)
		end
		return table 	
  end

  def get_names(api_key, iteration_number)
  	stories = Stories.new(api_key, iteration_number)
  	members = stories.get_craftsman_names 
  end
end


