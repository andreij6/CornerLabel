class AddDifficultytoRecipe < ActiveRecord::Migration
  def up
    add_column :recipes, :difficulty, :string
  end

  def down
  end
end
