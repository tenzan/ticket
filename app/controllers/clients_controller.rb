class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  def index
    @clients = Client.all
  end
  
  def new
    @client = Client.new
  end
  
  def create
    @client = Client.new(client_params)
    
    if @client.save
      flash[:notice] = 'Client has been created.'
      redirect_to @client
    else
      flash.now[:alert] = 'Client has not been created.'
      render 'new'
    end
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
  
  def destroy
    @client.destroy
    
    flash[:notice] = 'Client has been deleted.'
    redirect_to clients_path
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
