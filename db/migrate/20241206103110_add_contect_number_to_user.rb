class AddContectNumberToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :contect_number, :string
  end
end
