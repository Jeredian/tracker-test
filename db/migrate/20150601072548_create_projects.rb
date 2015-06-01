class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.boolean :enabled, default: true
      t.datetime :date_create, default: DateTime.now

      t.timestamps null: false
    end
  end
end
