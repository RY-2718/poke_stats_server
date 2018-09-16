class CreateBattles < ActiveRecord::Migration[5.2]
  def change
    create_table :battles do |t|
      t.integer :my_rate
      t.integer :opp_rate
      t.string :opp_name
      t.boolean :win
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
