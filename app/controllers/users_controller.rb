class UsersController < ApplicationController
  def show
    @user_list = get_user_list
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.new_record?
      if @user.save
        puts 'user has been created.'
        redirect_to '/'
      end
    end
  end

  def edit
    @user = User.find(params[:id])
    @project_list = Project.where(enabled: true)
    #@user_project = UserProject.where(user_id: params[:id], enabled: true)
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      @user_list = get_user_list
      render action: 'show'
    else
      render action: 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name,:email,:password)
  end

  private
  def get_user_list
    return User.eager_load(:user_role).where(enabled: true)
    #, user_role: { enable:true }
    #.eager_load()
    #.includes(:user_role)
    #.references(:user_role)
  end
end
