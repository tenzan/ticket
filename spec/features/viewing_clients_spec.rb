require 'rails_helper'

RSpec.feature 'Users can view clients' do
	let(:user) { FactoryGirl.create(:user) }
	let(:client) { FactoryGirl.create(:client, name: 'Microsoft') }

	before do
    	login_as(user)
        assign_role!(user, :viewer, client)
	end

  scenario 'with the clients details' do
    visit '/'
    click_link 'Microsoft'
    expect(page.current_url).to eq client_url(client)
  end

  scenario 'unless they do not have permission' do
    FactoryGirl.create(:client, name: 'Hidden')
    visit '/'
    expect(page).not_to have_content 'Hidden'
  end
end