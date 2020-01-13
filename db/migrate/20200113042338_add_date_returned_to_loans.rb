class AddDateReturnedToLoans < ActiveRecord::Migration[6.0]
  def change
    add_column :loans, :date_returned, :date
  end
end
