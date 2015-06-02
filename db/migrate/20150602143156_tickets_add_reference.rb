class TicketsAddReference < ActiveRecord::Migration
  def change
    add_reference(:tickets, :project_id)
  end
end
