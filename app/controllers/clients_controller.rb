class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update]

  def index
    @clients = Client.all
  end

  def show
  end

  def edit
  end

  def update

    if @client.update(client_params)
      flash[:notice] = 'Client has been updated.'
      redirect_to @client
    else
      flash.now[:alert] = 'Client has not been updated.'
      render 'edit'
    end
  end

  private

  def set_client
    @client = Client.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'The client you were looking for could not be found'
    redirect_to clients_path
  end

  def client_params
    params.require(:client).permit(:name, :description)
  end
end
