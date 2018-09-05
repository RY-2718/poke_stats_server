class CreateMyPokes < ActiveRecord::Migration[5.2]
  def change
    create_table :my_pokes do |t|
      t.integer :poke_dex_id
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
