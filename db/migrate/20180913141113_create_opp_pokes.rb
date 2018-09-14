class CreateOppPokes < ActiveRecord::Migration[5.2]
  def change
    create_table :opp_pokes do |t|
      t.string :ability
      t.string :item
      t.text :memo
      t.string :nature
      t.integer :poke_dex_id
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
