class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :title
      t.text :description
      t.boolean :enabled, default: false
      t.datetime :date_create, default: DateTime.now
      t.timestamps null: false
    end
  end
end
