class CreateSpaces < ActiveRecord::Migration[6.1]
  def change
    create_table :spaces do |t|
      t.string :title
      t.text :description
      t.integer :type
      t.string :address
      t.integer :price_per_hour

      t.timestamps
    end
  end
end
