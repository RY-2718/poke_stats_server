class CreateBattleOppPokes < ActiveRecord::Migration[5.2]
  def change
    create_table :battle_opp_pokes do |t|
      t.references :battle, foreign_key: true
      t.references :opp_poke, foreign_key: true
      t.integer :order

      t.timestamps
    end
  end
end
