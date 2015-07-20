require "rails_helper"

RSpec.feature "Users can only see the appropriate links" do
  let(:client) { FactoryGirl.create(:client) }
  let(:user)  { FactoryGirl.create(:user) }
  let(:admin) { FactoryGirl.create(:user, :admin) }

  context "anonymous users" do
    scenario "cannot see the New Client link" do
      visit "/"
      expect(page).not_to have_link "New Client"
    end
  end

  context "non-admin users (client viewers)" do
    before do 
      login_as(user)
      assign_role!(user, :viewer, client)
    end

    scenario "cannot see the New Client link" do
      visit "/"
      expect(page).not_to have_link "New Client"
    end

    scenario "cannot see the Delete Client link" do
      visit client_path(client)
      expect(page).not_to have_link "Delete Client"
    end
  end

  context "admin users" do
    before { login_as(admin) }
    scenario "can see the New Client link" do
      visit "/"
      expect(page).to have_link "New Client"
    end
    scenario "can see the Delete Client link" do
      visit client_path(client)
      expect(page).to have_link "Delete Client"
    end
  end

end
