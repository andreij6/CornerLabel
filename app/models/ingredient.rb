class Ingredient < ActiveRecord::Base
  attr_accessible :name, :recipe_id
  
  belongs_to :recipe, :counter_cache => true
  belongs_to :steps, :counter_cache => true
  
  validates :name,       :presence => true,
                          length: { minimum: 2 }
end
