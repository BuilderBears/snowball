class AddTopicIdToResponse < ActiveRecord::Migration
  def change
    add_column :responses, :topic_id, :integer
  end
end
