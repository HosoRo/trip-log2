class AddColumnArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :user_id, :integer, foreign_key: true
  end
end
