class Addimagestosteps < ActiveRecord::Migration
  def up
    add_column :steps, :image, :string
  end

  def down
  end
end
