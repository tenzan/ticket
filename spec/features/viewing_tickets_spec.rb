require 'rails_helper'

RSpec.feature 'Users can view tickets' do
  before do
    author = FactoryGirl.create(:user)

    microsoft = FactoryGirl.create(:client, name: 'Microsoft')
    assign_role!(author, :viewer, microsoft)
    FactoryGirl.create(:ticket, client: microsoft,
                       author: author,
                       subject: 'Windows Update',
                       details: 'Update not working!')

    apple = FactoryGirl.create(:client, name: 'Apple')
    assign_role!(author, :viewer, apple)
    FactoryGirl.create(:ticket, client: apple,
                       subject: 'OS update issue', details: "Can't update to Yoshemite")

    login_as(author)
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
