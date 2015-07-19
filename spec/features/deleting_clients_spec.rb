require "rails_helper"

RSpec.feature 'Users can delete clients' do
  scenario 'successfully' do
    FactoryGirl.create(:client, name: 'Microsoft')
    
    visit '/'
    click_link 'Microsoft'
    click_link 'Delete Client'
    
    expect(page).to have_content 'Client has been deleted.'
    expect(page.current_url).to eq clients_url
    expect(page).to have_no_content 'Microsoft'
  end
end