require 'spec_helper'

describe 'visiting the list view page' do
  before do
    visit '/list'
  end

	it "list/view.html.erb" do
  	page.should have_selector('.table')
	end
end