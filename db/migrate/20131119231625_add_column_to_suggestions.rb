class AddColumnToSuggestions < ActiveRecord::Migration
  def change
    add_column :suggestions, :description, :string
  end
end
