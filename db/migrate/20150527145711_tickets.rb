class Tickets < ActiveRecord::Migration
  def change
    change_column_default(:tickets,:enabled,true)
  end
end
