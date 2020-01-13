class RemoveStatusFromLoans < ActiveRecord::Migration[6.0]
  def change
    remove_column :loans, :status
  end
end
