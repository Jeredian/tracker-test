class AddProjectUsers < ActiveRecord::Migration
  def change
    create_table :project_users, id: false do |t|
      t.integer :project_id
      t.integer :user_id
    end
    drop_table :user_projects
  end
end
