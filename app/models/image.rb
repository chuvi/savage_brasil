class Image < Asset
  
  has_attached_file :image, 
                    :styles => { :thumb => "200x200>", :medium => "500x500>" },
                    :default_url => "/images/missing_logo.png"
                    
  validates_attachment_presence :image
  validates_attachment_content_type :image, :content_type => ["image/jpeg", "image/png"]
  
end
