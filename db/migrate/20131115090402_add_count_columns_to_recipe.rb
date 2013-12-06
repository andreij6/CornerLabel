class AddCountColumnsToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :steps_count, :integer, :default => 0 
    add_column :recipes, :ingredients_count, :integer, :default => 0 
  end
end
