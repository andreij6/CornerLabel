class AddimagetoRecipe < ActiveRecord::Migration
  def up
    add_column :recipes, :image, :string
  end

  def down
  end
end
