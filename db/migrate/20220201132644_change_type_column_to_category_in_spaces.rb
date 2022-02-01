class ChangeTypeColumnToCategoryInSpaces < ActiveRecord::Migration[6.1]
  def change
    rename_column :spaces, :type, :category
  end
end
