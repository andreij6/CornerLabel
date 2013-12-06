class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string  :title

      t.timestamps
    end
  end
  
  def self.down
    drop_table :recipes
  end
  
end
