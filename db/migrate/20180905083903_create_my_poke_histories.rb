class CreateMyPokeHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :my_poke_histories do |t|
      t.string :item
      t.string :ability
      t.string :nature
      t.integer :effort_h
      t.integer :effort_a
      t.integer :effort_b
      t.integer :effort_c
      t.integer :effort_d
      t.integer :effort_s
      t.integer :individual_h
      t.integer :individual_a
      t.integer :individual_b
      t.integer :individual_c
      t.integer :individual_d
      t.integer :individual_s
      t.references :my_poke, foreign_key: true

      t.timestamps
    end
  end
end
