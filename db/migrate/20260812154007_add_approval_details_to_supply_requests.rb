class AddApprovalDetailsToSupplyRequests < ActiveRecord::Migration[8.1]
  def change
    add_reference :supply_requests, :approved_by, foreign_key: { to_table: :users }
    add_column :supply_requests, :approved_at, :datetime
  end
end
