class Demo < ActiveRecord::Base
  
  set_table_name "assets"

  belongs_to :user

  has_attached_file :data
                    # :styles => { :thumb => "200x200>", :medium => "500x500>" },
                    # :default_url => "/images/missing_logo.png"
  
end