class CreateClassifieds < ActiveRecord::Migration[6.1]
  def change
    create_table :classifieds do |t|
      t.string :description, default: ''
      t.references :user, null: false, foreign_key: true
      t.integer :upvotes, default: 0
      t.string :topic, default: ''

      t.timestamps
    end
  end
end
