class ProjectsController < ApplicationController

  def index
    @project_list = current_user.projects
  end

  def new
    @project = Project.new
    @project_list = getProjectList()
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(project_params)
    if @project.new_record?
      if @project.save
        puts 'Project has been created.'
        @project_list = getProjectList()
        render action: 'new'
      end
    end
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      @project_list = getProjectList()
      render action: 'new'
    else
      render action: 'edit'
    end
  end

  def destroy
    @project = Project.find(params[:id])
    if @project.update(enabled: false)
      puts 'Project has not been deleted.'
      @tickets = Ticket.where(project_id: params[:id])
      if @tickets.update_all(enabled: false)
        puts 'Project has not been deleted.'
      end
      @project_list = getProjectList()
      render action: 'new'
    else
      puts 'Something is wrong. :/'
      render action: 'new'
    end
  end

  private
  def project_params
    params.require(:project).permit(:name, :description)
  end

  private
  def getProjectList
    return Project.where(enabled: true)
  end
end
