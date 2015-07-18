require 'rails_helper'

RSpec.feature 'Users can create new clients' do
  scenario 'with valid attributes' do
    visit '/'
    
    click_link 'New Client'
    
    fill_in 'Name', with: 'Microsoft'
    fill_in 'Description', with: 'Software developer'
    click_button 'Create Client'
    
    expect(page).to have_content 'Client has been created.'
    
    client = Client.find_by(name: 'Microsoft')
    expect(page.current_url).to eq client_url(client)
    
    title = 'Microsoft - Clients - Ticketing System'
    expect(page).to have_title title
  end
end