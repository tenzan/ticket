class ClientsController < ApplicationController
  def index
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
      # nothing yet
    end
  end
  
  def show
    @client = Client.find(params[:id])
  end
  
  private
  
  def client_params
    params.require(:client).permit(:name, :description)
  end
end
