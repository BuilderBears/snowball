class ChangeColumnForResponse < ActiveRecord::Migration
  def change
    rename_column :responses, :name, :title
  end
end
