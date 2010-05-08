class Shout < ActiveRecord::Base
  
  belongs_to :user
  
  validates_length_of :content, :maximum => 300
  
end