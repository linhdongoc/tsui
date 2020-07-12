class RemoveNameFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :password_digest, :string
    remove_column :users, :name, :string
  end
end
