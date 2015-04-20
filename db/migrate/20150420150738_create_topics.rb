class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.text :title
      t.text :description
      t.references :category, index: true

      t.timestamps null: false
    end
    add_foreign_key :topics, :categories
  end
end
