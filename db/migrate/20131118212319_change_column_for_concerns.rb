class ChangeColumnForConcerns < ActiveRecord::Migration
  def change
    rename_column :concerns, :name, :title
  end
end
