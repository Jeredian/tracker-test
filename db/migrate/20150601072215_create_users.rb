class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.integer :user_role_id, default: 2
      t.boolean :enabled, default: true
      t.datetime :date_create, default: DateTime.now

      t.timestamps null: false
    end
  end
end
