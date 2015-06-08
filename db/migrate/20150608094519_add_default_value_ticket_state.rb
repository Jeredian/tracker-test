class AddDefaultValueTicketState < ActiveRecord::Migration
  def change
    change_column_default :tickets, :state, :shelduled
  end
end
