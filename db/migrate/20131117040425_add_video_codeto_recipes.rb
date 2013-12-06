class AddVideoCodetoRecipes < ActiveRecord::Migration
  def up
    add_column :recipes, :video, :string
  end

  def down
  end
end
