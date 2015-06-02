class TicketsController < ApplicationController
  def show
    @tickets = getTicketList()
  end

  def new
    @ticket = Ticket.new
    @project_list = Project.where(enabled: true)
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.date_create =  DateTime.now
    if @ticket.save
      puts 'Ticket has been created.'
      @tickets = getTicketList()
      render action: 'show'
    else
      puts 'Ticket has not been created.'
      render action: 'new'
    end
  end

  def destroy
    @ticket = Ticket.find(params[:id])
    if @ticket.update(enabled: false)
      puts 'Ticket has not been deleted.'
      @tickets = getTicketList()
      render action: 'show'
    else
      puts 'Something is wrong. :/'
      render action: 'show'
    end
  end

  private
  def ticket_params
    params.require(:ticket).permit(:title, :description, :project_id)
  end

  private
  def getTicketList
    return Ticket.where(enabled: true)
  end

end
