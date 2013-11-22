class AddColumnsToComments < ActiveRecord::Migration
  def change
    add_column :comments, :suggestion_id, :integer
    add_column :comments, :user_id, :integer
  end
end
