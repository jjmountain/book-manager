class RenameQuantityToQuantityRemaining < ActiveRecord::Migration[6.0]
  def change
    rename_column :books, :quantity, :quantity_remaining
  end
end
