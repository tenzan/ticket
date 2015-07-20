require 'rails_helper'

RSpec.feature 'Users can delete tickets' do
	let(:author) { FactoryGirl.create(:user) }
	let(:client) { FactoryGirl.create(:client) }
  let(:ticket) do
		FactoryGirl.create(:ticket, client: client, author: author)
  end

  before do
    login_as(author)
    assign_role!(author, :viewer, client)
    visit client_ticket_path(client, ticket)
	end

	scenario "successfully" do
        click_link "Delete Ticket"
        expect(page).to have_content "Ticket has been deleted."
        expect(page.current_url).to eq client_url(client)
  end

end
