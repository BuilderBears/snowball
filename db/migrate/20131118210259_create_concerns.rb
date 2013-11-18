class CreateConcerns < ActiveRecord::Migration
  def change
    create_table :concerns do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
