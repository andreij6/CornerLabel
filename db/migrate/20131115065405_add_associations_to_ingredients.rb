class AddAssociationsToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :recipe_id, :integer
    add_column :ingredients, :step_id, :integer
  end
end
