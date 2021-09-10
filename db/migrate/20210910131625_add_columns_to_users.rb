class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :username, :string, default: ''
    add_column :users, :description, :string, default: ''
    add_column :users, :age, :string, default: ''
  end
end
