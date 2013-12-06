class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.integer :recipe_id
      t.integer :step_no
      t.integer :ingredient_id
      t.string  :unit
      t.string  :quantity
      t.text    :description

      t.timestamps
    end
  end
  
  def self.down
    drop_table :steps
  end
  
end
