class ListController < ApplicationController

	def view
		@iterations = Tables.new.create_project_table
	end
end
