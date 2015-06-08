class TicketsController < ApplicationController
  def index
    @tickets = get_ticket_list
  end

  def show
    @ticket = Ticket.find_by(enabled:true, id: params[:id])
  end

  def new
    @ticket = Ticket.new
    @project_list = Project.where(enabled: true)
  end

  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      puts 'Ticket has been created.'
      @tickets = get_ticket_list
      render action: 'index'
    else
      puts 'Ticket has not been created.'+@ticket.errors.full_messages[0]
      @project_list = Project.where(enabled: true)
      render action: 'new'
    end
  end

  def edit
    @ticket = Ticket.find_by(enabled:true, id: params[:id])
    @states = Ticket.state_machine.states
  end

  def update
    @ticket = Ticket.find(params[:id])
    if @ticket.update(ticket_update_params)
      redirect_to '/projects/'+@ticket.project_id.to_s
    else
      render action: 'edit'
    end
  end

  def destroy
    @ticket = Ticket.find(params[:id])
    if @ticket.update(enabled: false)
      puts 'Ticket has not been deleted.'
      @tickets = get_ticket_list
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
  def ticket_update_params
    params.require(:ticket).permit(:title, :description, :state)
  end

  private
  def get_ticket_list
    return Ticket.where(enabled: true)
  end

end
