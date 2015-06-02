class DeleteTicketColumn1 < ActiveRecord::Migration
  def change
    remove_column :tickets, :project_id_id
  end
end
