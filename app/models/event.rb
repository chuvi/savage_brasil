class Event < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :image
  belongs_to :comment
  belongs_to :demo
  belongs_to :map
  
  default_scope :order => "created_at DESC"
  
  # create_image_comment
  # create_image
  # create_map_comment
  # create_user
  
end