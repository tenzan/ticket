require 'rails_helper'

RSpec.feature 'Users can delete tickets' do
	let(:client) { FactoryGirl.create(:client) }
    let(:ticket) { FactoryGirl.create(:ticket, client: client) }
    
    before do
    	visit client_ticket_path(client, ticket)
	end

	scenario "successfully" do
        click_link "Delete Ticket"
        expect(page).to have_content "Ticket has been deleted."
        expect(page.current_url).to eq client_url(client)
    end
	
end