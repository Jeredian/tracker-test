class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_user!
  before_filter :getUsers
  def after_sign_in_path_for(resource)
    if resource.is_a?(User)
      projects_url
    else
      root_url
    end
  end

  def getUsers
    @user_data = User.where(enabled: true)
  end


  #def authenticate_user
  #  @user_current = User.where(user_role_id: 1, enabled: true).find(1)
  #end
end
