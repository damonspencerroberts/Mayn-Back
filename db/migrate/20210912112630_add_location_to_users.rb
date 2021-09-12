class AddLocationToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :location, :jsonb, default: {}
  end
end
