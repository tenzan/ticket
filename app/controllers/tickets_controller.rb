class TicketsController < ApplicationController
  before_action :set_client
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  def new
    @ticket = @client.tickets.build
  end

  def create
    @ticket = @client.tickets.build(ticket_params)
    if @ticket.save
      flash[:notice] = 'Ticket has been created.'
      redirect_to [@client, @ticket]
    else
      flash.now[:alert] = 'Ticket has not been created.'
      render 'new'
      end
  end

  def show
  end

  private

  def set_client
    @client = Client.find(params[:client_id])
  end

  def set_ticket
    @ticket = @client.tickets.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:subject, :details)
  end
end
