class ChangeColumnToMyPokeHistoryMove < ActiveRecord::Migration[5.2]
  def change
    remove_column :my_poke_history_moves, :move, :string
    add_column :my_poke_history_moves, :move_id, :integer
  end
end
