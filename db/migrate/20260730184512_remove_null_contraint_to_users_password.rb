class RemoveNullContraintToUsersPassword < ActiveRecord::Migration[8.1]
  def change
    change_column_null :users, :password, true
  end
end
