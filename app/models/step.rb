class Step < ActiveRecord::Base
   # Accessors
  attr_accessible :step_no, :unit, :quantity, :description, :recipe_id, :image, :remote_image_url
  
  # Associations
  has_many :ingredients, :dependent => :destroy
  
  belongs_to :recipe

  mount_uploader :image, ImageUploader
  
  # Validations
  validates :step_no,   :presence => true
  validates :description,    :presence => true
  validates :recipe_id, :presence => true
  
end
