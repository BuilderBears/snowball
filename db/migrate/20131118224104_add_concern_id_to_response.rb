class AddConcernIdToResponse < ActiveRecord::Migration
  def change
    add_column :responses, :concern_id, :integer
  end
end
