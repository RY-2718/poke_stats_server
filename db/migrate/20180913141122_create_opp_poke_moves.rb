class CreateOppPokeMoves < ActiveRecord::Migration[5.2]
  def change
    create_table :opp_poke_moves do |t|
      t.integer :move_id
      t.references :opp_poke, foreign_key: true

      t.timestamps
    end
  end
end
