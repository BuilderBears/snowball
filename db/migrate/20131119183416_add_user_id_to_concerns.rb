class AddUserIdToConcerns < ActiveRecord::Migration
  def change
    add_column :concerns, :user_id, :integer
    add_index :concerns, :user_id
  end
end
