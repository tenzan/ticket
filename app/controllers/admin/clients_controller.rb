class Admin::ClientsController < Admin::ApplicationController

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

  def destroy
    @client = Client.find(params[:id])
    @client.destroy

    flash[:notice] = 'Client has been deleted.'
    redirect_to clients_path
  end

  private

  def client_params
    params.require(:client).permit(:name, :description)
  end

end
