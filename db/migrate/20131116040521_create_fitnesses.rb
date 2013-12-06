class CreateFitnesses < ActiveRecord::Migration
  def change
    create_table :fitnesses do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
