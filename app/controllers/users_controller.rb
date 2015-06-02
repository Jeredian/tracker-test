class UsersController < ApplicationController
  def show
    @userList = getUserList()
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

  #TODO add update user

  private
  def user_params
    params.require(:user).permit(:name,:email,:password)
  end

  private
  def getUserList
    return User.where(enabled: true)
  end
end
