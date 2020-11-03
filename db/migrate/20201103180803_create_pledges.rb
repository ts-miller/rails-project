class CreatePledges < ActiveRecord::Migration[6.0]
  def change
    create_table :pledges do |t|
      t.integer :user_id
      t.integer :creator_id
      t.decimal :amount

      t.timestamps
    end
  end
end
