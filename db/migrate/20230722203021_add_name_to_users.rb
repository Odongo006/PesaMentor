class AddNameToUsers < ActiveRecord::Migration[7.0] # Replace [7.0] with your Rails version
  def change
    add_column :users, :name, :string
  end
end
