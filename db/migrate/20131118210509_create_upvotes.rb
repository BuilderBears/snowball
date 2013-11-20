class CreateUpvotes < ActiveRecord::Migration
  def change
    create_table :upvotes do |t|
      t.references :suggestion, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end