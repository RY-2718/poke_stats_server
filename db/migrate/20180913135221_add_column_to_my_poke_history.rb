class AddColumnToMyPokeHistory < ActiveRecord::Migration[5.2]
  def change
    add_column :my_poke_histories, :memo, :text
  end
end
