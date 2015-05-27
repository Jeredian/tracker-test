class TicketsController < ApplicationController
  before_filter :get_tickets

  def show
  end

  def new
    @ticket = @tickets.build
  end

  def create
    @ticket = @tickets.build
    if @ticket.save
      puts "Ticket has been created."
      render :action => "show"
    else
      puts "Ticket has not been created."
      render :action => "new"
    end
  end

  private
  def get_tickets
    @tickets = Ticket.all
  end
end
