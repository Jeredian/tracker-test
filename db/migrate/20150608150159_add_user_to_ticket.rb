class AddUserToTicket < ActiveRecord::Migration
  def change
    add_column(:tickets, :creator, :integer )
    add_column(:tickets, :worker, :integer )
  end
end
