class Image < Asset
  
  has_many :comments, :as => :commentable

  has_attached_file :image, 
                    :styles => { :tiny => "64x64#",
                                 :thumb => "200x200>", 
                                 :medium => "500x500>" },
                    :default_url => "/images/missing_logo.png"
                    
  validates_attachment_presence :image
  validates_attachment_content_type :image, :content_type => ["image/jpeg", "image/png"]
  
end
