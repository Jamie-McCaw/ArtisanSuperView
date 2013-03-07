require 'spec_helper'

describe 'visiting the home page' do
  before do
    visit '/'
  end

	it "index.html.erb" do
  	page.should have_link('List View')
	end
end