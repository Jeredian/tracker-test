class DeleteDataCreate < ActiveRecord::Migration
  def change
    remove_column(:tickets, :date_create)
    remove_column(:projects, :date_create)
    remove_column(:users, :date_create)
    remove_column(:user_projects, :date_create)
    remove_column(:user_roles, :date_create)
  end
end
