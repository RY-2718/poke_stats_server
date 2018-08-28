class RemoveColumnsFromUsersAndCreateUserTokens < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :token, :string

    create_table :user_tokens do |t|
      t.references :user, index: true, foregin_key: true
      t.string :token

      t.timestamps
    end
  end
end
