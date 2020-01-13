class AddReturnedToLoans < ActiveRecord::Migration[6.0]
  def change
    add_column :loans, :returned, :boolean, default: false
  end
end
