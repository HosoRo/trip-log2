class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
     t.string :title, null: false
     t.text :description, null: false
     t.text :image
     t.timestamps, null: false
    end
  end
end
