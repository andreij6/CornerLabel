class CreateTeches < ActiveRecord::Migration
  def change
    create_table :teches do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
