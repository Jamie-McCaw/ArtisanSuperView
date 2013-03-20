require 'spec_helper'

describe 'visiting the calendar view page' do
  before do
    visit '/calendar'
  end

	it "calendar/view.html.erb" do
  	page.should have_selector('#calendar')
	end
end