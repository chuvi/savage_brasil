class Demo < Asset
  
  validates_presence_of :title
  
  has_many :comments, :as => :commentable

  has_attached_file :data
                    # :styles => { :thumb => "200x200>", :medium => "500x500>" },
                    # :default_url => "/images/missing_logo.png"
  def content
    @content ||= IO.read(data.path)
  end

  def config
    @config ||= content.split("\217\002\000\000").second.split("\003\000\000\000").first.to_savage_hash
  end
  
  def name
    config["svr_name"]
  end
  
end
