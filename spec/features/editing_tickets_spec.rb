require 'rails_helper'

RSpec.feature "Users can edit existing tickets" do
  let(:author) { FactoryGirl.create(:user) }
  let(:client) { FactoryGirl.create(:client) }
  let(:ticket) do
    FactoryGirl.create(:ticket, client: client, author: author)
  end

  before do
    visit client_ticket_path(client, ticket)
    click_link "Edit Ticket"
  end

  scenario "with valid attributes" do
    fill_in "Subject", with: "Windows OS"
    click_button "Update Ticket"

    expect(page).to have_content "Ticket has been updated."

    within("#ticket h2") do
      expect(page).to have_content "Windows OS"
      expect(page).not_to have_content ticket.subject
    end
  end

  scenario "with invalid attributes" do
    fill_in "Subject", with: ""
    click_button "Update Ticket"

    expect(page).to have_content "Ticket has not been updated."
  end
end
