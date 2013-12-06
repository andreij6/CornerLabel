class Addcategorytorecipes < ActiveRecord::Migration
  def up
    add_column :recipes, :category, :string
  end

  def down
  end
end
