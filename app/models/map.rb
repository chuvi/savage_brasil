class Map < ActiveRecord::Base
  
  MAPS_URL = 'http://newerth.com/maps/sav1/'
  THUMBS_URL = 'http://newerth.com/maps/sav1/thumbs/'

  has_many :snapshots
  has_many :matches
  
  validates_uniqueness_of :name
  validates_presence_of :name
  
  cattr_reader :per_page
  @@per_page = 100
  
  has_attached_file :image, :path => ":rails_root/public/system/:class_:attachment/:id_:style.:extension",
                            :url => "/system/:class_:attachment/:id_:style.:extension",
                            :styles => { :thumb => "100x100>",
                                         :medium => "350x350>" }
  
  def overhead_link
    "#{MAPS_URL}#{name}_overhead.jpg"
  end
  
  def thumb_link
    "#{THUMBS_URL}#{name}_thumb.jpg"
  end

end
