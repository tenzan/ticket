require 'rails_helper'

RSpec.feature 'Users can create new clients' do
  before do
    visit '/'
    
    click_link 'New Client'
  end
  scenario 'with valid attributes' do
    fill_in 'Name', with: 'Microsoft'
    fill_in 'Description', with: 'Software developer'
    click_button 'Create Client'
    
    expect(page).to have_content 'Client has been created.'
    
    client = Client.find_by(name: 'Microsoft')
    expect(page.current_url).to eq client_url(client)
    
    title = 'Microsoft - Clients - Ticketing System'
    expect(page).to have_title title
  end
  
  scenario 'when providing invalid attributes' do
    click_button 'Create Client'
    
    expect(page).to have_content 'Client has not been created.'
    expect(page).to have_content "Name can't be blank"
  end
end