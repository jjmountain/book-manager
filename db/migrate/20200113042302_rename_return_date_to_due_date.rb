class RenameReturnDateToDueDate < ActiveRecord::Migration[6.0]
  def change
    rename_column :loans, :return_date, :due_date
  end
end
