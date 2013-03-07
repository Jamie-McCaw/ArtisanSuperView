class ListController < ApplicationController
  
  def view
  	project = Project.new
  	iterations = Iterations.new

		project_name = project.get_project_name
		project_iterations = iterations.get_all_project_iterations

		@iterations = build_row_hash(project_iterations, project_name)
  end

  def build_row_hash(iterations, project_name)
  	table = Array.new
		iterations.each_with_index do |iteration, i|
			row = Hash.new
			row.store(:project_name, project_name)
			row.store(:iteration_number, iteration[:number])
			row.store(:members, get_names(iteration[:number]))
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

  def get_names(iteration_number)
  	stories = Stories.new(iteration_number)
  	members = stories.get_craftsman_names 
  end
end


