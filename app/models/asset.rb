class Asset < ActiveRecord::Base
  
  belongs_to :user
  
  has_attached_file :image, 
                    :styles => { :thumb => "200x200>", :medium => "500x500>" },
                    :default_url => "/images/missing_logo.png"
                    
  validates_attachment_presence :image
                    
end