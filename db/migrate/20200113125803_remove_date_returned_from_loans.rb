class RemoveDateReturnedFromLoans < ActiveRecord::Migration[6.0]
  def up
    remove_column :loans, :date_returned
  end

  def down
    add_column :loans, :date_returned, :date
  end
end
