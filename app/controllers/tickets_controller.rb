class TicketsController < ApplicationController
  before_filter :get_tickets

  def show
  end

  def new
    @ticket = @tickets.new
  end

  def create
    @ticket = @tickets.new(ticket_params)
    if @ticket.save
      puts "Ticket has been created."
      render :action => "show"
    else
      puts "Ticket has not been created."
      render :action => "new"
    end
  end

  private
  def ticket_params
    params.require(:ticket).permit(:title, :description)
  end

  private
  def get_tickets
    @tickets = Ticket.all.where('enabled=?',true)
  end
end
