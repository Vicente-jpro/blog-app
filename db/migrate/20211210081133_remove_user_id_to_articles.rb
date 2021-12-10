class RemoveUserIdToArticles < ActiveRecord::Migration[6.1]
  def change
    remove_column :articles, :user2_id, :integer
  end
end
