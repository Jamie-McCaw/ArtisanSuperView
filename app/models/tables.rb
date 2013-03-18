class Tables
	def initialize
		@api_keys = Keys.new.get_keys
	end

	def create_project_table
  	projects = Array.new
  	@api_keys.each do |api_key|
			project_name = Project.new(api_key).get_project_name
			project_iterations = Iterations.new(api_key).get_all_project_iterations
			projects.push(build_row_hash(project_iterations, project_name, api_key))
		end
		iterations = projects.flatten
  end

  def build_row_hash(iterations, project_name, api_key)
  	table = Array.new
		iterations.each do |iteration|
			row = build_hash_of_project_information(iteration, project_name, api_key)
			table.push(row)
		end
		return table 	
  end

  def get_names(api_key, iteration_number)
  	stories = Stories.new(api_key, iteration_number)
  	members = stories.get_craftsman_names 
  end

  def build_hash_of_project_information(iteration, project_name, api_key) 
		row = Hash.new
		row.store(:project_name, project_name)
		row.store(:iteration_number, iteration[:number])
		row.store(:members, get_names(api_key, iteration[:number]))
		row.store(:billed_points, billed_points(iteration))
		row.store(:total_bug_points, get_total_bug_points(iteration))
		row.store(:completed_points, get_committed_points(iteration))
		row.store(:iteration_completed?, iteration[:complete])
    row.store(:start_date, iteration_start_date(iteration))
    row.store(:finish_date, iteration_finish_date(iteration))
		return row
  end

  def get_total_bug_points(iteration)
  	return committed_points(iteration) == nil ? 0 : calculate_bug_points(iteration)
  end

  def get_committed_points(iteration)
  	return committed_points(iteration) == nil ? 0 : committed_points(iteration)
  end

  def committed_points(iteration)
  	iteration[:committed_points_at_completion]
  end

  def calculate_bug_points(iteration)
  	committed_points(iteration).to_f - billed_points(iteration)	
  end

  def billed_points(iteration)
  	iteration[:total_billed_points]	
  end

  def iteration_start_date(iteration)
    iteration[:start_date]
  end

  def iteration_finish_date(iteration)
    iteration[:finish_date]
  end	
end