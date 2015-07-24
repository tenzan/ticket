require 'rails_helper'

RSpec.feature 'Users can edit existing clients' do
  let(:user) { FactoryGirl.create(:user) }
  let(:client) { FactoryGirl.create(:client, name: "Microsoft") }

  before do
    login_as(user)
    assign_role!(user, :manager, client)
  
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