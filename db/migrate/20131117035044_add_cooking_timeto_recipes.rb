class AddCookingTimetoRecipes < ActiveRecord::Migration
  def up
    add_column :recipes, :prep_time, :string
    add_column :recipes, :missed_time, :string
    add_column :recipes, :total_time, :string
  end

  def down
  end
end
