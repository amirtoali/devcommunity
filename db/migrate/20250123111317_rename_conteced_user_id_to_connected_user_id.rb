class RenameContecedUserIdToConnectedUserId < ActiveRecord::Migration[7.0]
  def change
     rename_column :connections, :conteced_user_id, :connected_user_id
  end
end
