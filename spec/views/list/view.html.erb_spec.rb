require 'spec_helper'

describe 'visiting the list view page' do
  before do
    visit '/list'
  end

	it "list/view.html.erb" do
  	page.should have_selector('#here_table')
	end

	it "list/view.html.erb also has" do
		page.should have_selector('#datepicker')
	end
end