class AddTopicIdToSuggestion < ActiveRecord::Migration
  def change
    add_column :suggestions, :topic_id, :integer
  end
end
