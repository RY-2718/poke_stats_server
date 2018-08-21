class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :token
      t.string :google_uid

      t.timestamps
    end
  end
end
