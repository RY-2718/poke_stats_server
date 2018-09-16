class CreateBattleMyPokeHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :battle_my_poke_histories do |t|
      t.references :battle, foreign_key: true
      t.references :my_poke_history, foreign_key: true
      t.integer :order

      t.timestamps
    end
  end
end
