require 'rails_helper'

RSpec.describe ClientsController, type: :controller do
  it 'handlees a missing client correctly' do
    get :show, id: 'not-here'
    
    message = 'The client you were looking for could not be found'
    expect(flash[:alert]).to eq message
  end

  it 'handles permission errors by redirecting to a safe place' do
    allow(controller).to receive(:current_user)

    client = FactoryGirl.create(:client)
    get :show, id: client

    expect(response).to redirect_to(root_path)
    message = "You aren't allowed to do that."
    expect(flash[:alert]).to eq message
  end
end
