class AddColumnToBattle < ActiveRecord::Migration[5.2]
  def change
    add_column :battles, :memo, :text
  end
end
