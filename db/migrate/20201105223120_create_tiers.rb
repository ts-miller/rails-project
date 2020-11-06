class CreateTiers < ActiveRecord::Migration[6.0]
  def change
    create_table :tiers do |t|
      t.string :title
      t.integer :amount
      t.string :description
      t.integer :creator_id

      t.timestamps
    end
  end
end
