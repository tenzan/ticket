require 'rails_helper'

RSpec.describe ClientsController, type: :controller do
  it 'handlees a missing client correctly' do
    get :show, id: 'not-here'
    
    message = 'The client you were looking for could not be found'
    expect(flash[:alert]).to eq message
  end
end
