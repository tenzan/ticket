require 'rails_helper'

RSpec.feature 'Users can create new clients' do
  scenario 'with valid attributes' do
    visit '/'
    
    click_link 'New Client'
    
    fill_in 'Name', with: 'Microsoft'
    fill_in 'Description', with: 'Software developer'
    click_button 'Create Client'
    
    expect(page).to have_content 'Client has been created.'
  end
end