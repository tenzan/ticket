require 'rails_helper'

describe ClientPolicy do

  let(:user) { User.new }

  subject { ClientPolicy }

  permissions :show? do
    let(:user) { FactoryGirl.create :user }
    let(:client) { FactoryGirl.create :client }
    it "blocks anonymous users" do
      expect(subject).not_to permit(nil, client)
    end

    it "allows viewers of the client" do
      assign_role!(user, :viewer, client)
      expect(subject).to permit(user, client)
    end

    it "allows editors of the client" do
      assign_role!(user, :editor, client)
      expect(subject).to permit(user, client)
    end

    it "allows managers of the client" do
      assign_role!(user, :manager, client)
      expect(subject).to permit(user, client)
    end
    
    it "allows administrators" do
      admin = FactoryGirl.create :user, :admin
      expect(subject).to permit(admin, client)
    end

    it "doesn't allow users assigned to other clients" do
      other_client = FactoryGirl.create :client
      assign_role!(user, :manager, other_client)
      expect(subject).not_to permit(user, client)
    end 
  end

end