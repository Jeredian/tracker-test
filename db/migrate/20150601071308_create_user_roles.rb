class CreateUserRoles < ActiveRecord::Migration
  def change
    create_table :user_roles do |t|
      t.string :name
      t.boolean :admin_panel, default: false
      t.boolean :add_project, default: false
      t.boolean :add_ticket, default: true
      t.boolean :enabled, default: true
      t.datetime :date_create, default: DateTime.now

      t.timestamps null: false
    end
  end
end
