class Recipe < ActiveRecord::Base
  attr_accessible :title, :recipe_id, :image, :remote_image_url, :description, :tip, 
                        :prep_time, :missed_time, :total_time, :video, :difficulty, :category
  
  has_many :steps, :dependent => :destroy
  has_many :ingredients, :through => :steps
  #has_reputation  finish this after u create a user model
    
  mount_uploader :image, ImageUploader
  
  validates :title,       :presence => true,
                          length: { minimum: 5 }
                          
  has_reputation :likes, :source => :user, :aggregated_by => :sum
  
end
