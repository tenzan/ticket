require 'rails_helper'

RSpec.feature 'Users can create new tickets' do
  let(:user) { FactoryGirl.create(:user) }
  before do
    login_as(user)
    client = FactoryGirl.create(:client, name: 'Internet Explorer')

    visit client_path(client)
    click_link 'New Ticket'
  end

  scenario 'with valid attributes' do
    fill_in 'Subject', with: 'Non-standard compliance'
    fill_in 'Details', with: 'My pages are ugly'
    click_button 'Create Ticket'

    expect(page).to have_content 'Ticket has been created.'
    within("#ticket") do
       expect(page).to have_content "Author: #{user.email}"
     end
  end

  scenario "when providing invalid attributes" do
    click_button "Create Ticket"
    expect(page).to have_content "Ticket has not been created."
    expect(page).to have_content "Subject can't be blank"
    expect(page).to have_content "Details can't be blank"
  end

  scenario "with an invalid description" do
    fill_in "Subject", with: "Non-standards compliance"
    fill_in "Details", with: "It sucks"
    click_button "Create Ticket"
    expect(page).to have_content "Ticket has not been created."
    expect(page).to have_content "Details is too short"
  end
end
