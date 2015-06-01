class CreateUserProjects < ActiveRecord::Migration
  def change
    create_table :user_projects do |t|
      t.integer :user_id
      t.integer :project_id
      t.boolean :enabled, default: true
      t.datetime :date_create, default: DateTime.now

      t.timestamps null: false
    end
  end
end
