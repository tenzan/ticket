require 'rails_helper'

RSpec.feature 'Users can view tickets' do
  before do
    microsoft = FactoryGirl.create(:client, name: 'Microsoft')
    FactoryGirl.create(:ticket, client: microsoft,
                       subject: 'Windows Update',
                       details: 'Update not working!')

    apple = FactoryGirl.create(:client, name: 'Apple')
    FactoryGirl.create(:ticket, client: apple,
                       subject: 'OS update issue', details: "Can't update to Yoshemite")

    visit '/'
  end

  scenario 'for a given client' do
    click_link 'Microsoft'

    expect(page).to have_content 'Windows Update'
    expect(page).to_not have_content 'OS update issue'

    click_link 'Windows Update'
    within('#ticket h2') do
      expect(page).to have_content 'Windows Update'
    end

    expect(page).to have_content 'Update not working!'
  end
end
