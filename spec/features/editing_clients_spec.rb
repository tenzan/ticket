require 'rails_helper'

RSpec.feature 'Users can edit existing clients' do
  before do
    FactoryGirl.create(:client, name: 'Microsoft')
  
    visit '/'
    click_link 'Microsoft'
    click_link 'Edit Client'
  end
  
  scenario 'with valid attributes' do
    fill_in 'Name', with: 'Microsoft 2'
    click_button 'Update Client'
    
    expect(page).to have_content 'Client has been updated.'
    expect(page).to have_content 'Microsoft 2'
  end
  
  scenario 'when providing invalid attributes' do
    fill_in 'Name', with: ''
    click_button 'Update Client'

    expect(page).to have_content 'Client has not been updated.'
  end
end