class RenameColumnPrivate < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :private, :privacy
  end
end
