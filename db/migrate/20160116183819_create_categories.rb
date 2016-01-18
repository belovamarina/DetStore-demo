class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title
      t.text :description
      t.attachment :picture

      t.timestamps null: false
    end
  end
end
