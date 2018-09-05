class CreateMyPokeHistoryMoves < ActiveRecord::Migration[5.2]
  def change
    create_table :my_poke_history_moves do |t|
      t.string :move
      t.references :my_poke_history, foreign_key: true

      t.timestamps
    end
  end
end
