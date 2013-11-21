class CreateTopicTags < ActiveRecord::Migration
  def change
    create_table :topic_tags do |t|
      t.references :topic, index: true
      t.references :tag, index: true
    end
  end
end
