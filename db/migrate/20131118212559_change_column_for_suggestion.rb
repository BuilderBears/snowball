class ChangeColumnForSuggestion < ActiveRecord::Migration
  def change
    rename_column :suggestions, :name, :title
  end
end
