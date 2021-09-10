class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :title, default: ''
      t.string :description, default: ''
      t.references :user, null: false, foreign_key: true
      t.integer :upvotes, default: 0

      t.timestamps
    end
  end
end
