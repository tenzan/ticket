require 'rails_helper'

RSpec.feature 'Users can view clients' do
  scenario 'with the clients details' do
    client = FactoryGirl.create(:client, name: 'Microsoft')
    
    visit '/'
    click_link 'Microsoft'
    expect(page.current_url).to eq client_url(client)
  end
end