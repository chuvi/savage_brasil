class Demo < Asset
  
  validates_presence_of :title
  
  has_attached_file :data
                    # :styles => { :thumb => "200x200>", :medium => "500x500>" },
                    # :default_url => "/images/missing_logo.png"
  
end
