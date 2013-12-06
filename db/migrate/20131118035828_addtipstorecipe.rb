class Addtipstorecipe < ActiveRecord::Migration
  def up
    add_column :recipes, :tip, :text
  end

  def down
  end
end
