require 'rails_helper'

RSpec.feature 'Users can view clients' do
	let(:user) { FactoryGirl.create(:user) }
	let(:client) { FactoryGirl.create(:client, name: "Microsoft") }

	before do
    	login_as(user)
        assign_role!(user, :viewer, client)
	end

  scenario 'with the clients details' do
    visit '/'
    click_link 'Microsoft'
    expect(page.current_url).to eq client_url(client)
  end
end