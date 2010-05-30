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
    @config ||= content[40..-1].split("\003\000\000\000").first.to_savage_hash
  end
  
  def players
    hash = {}
    content.gsub /\377n\376.+?\000/ do |c|
      fix = "\377n\376" + c
      hash[c.split("\377").second.gsub("n\376", "")] = fix.to_savage_hash
    end
    hash
  end
  
  def server_name
    config["svr_name"]
  end
  
  def map
    Map.find_by_name(config["svr_world"])
  end
  
  def chats
    array = []
    content.gsub /chat.+?\000/ do |c|
      array << c
    end
    array
  end
  
  # \000O)\000\000)8\001\000\260\000\000\000\270J\000\000\001\001\000\016chat_team ^clan 45319^radiodaweb.com Shl> rlxa jun \000
  # \000\253)\000\000\b;\001\000\246\000\000\000\273J\000\000\001\001\000\000chat_team ^clan 45319^Huscky#7> eles vao rusha tb \000
  # \000\177\t\000\000?D?\000\000\000?I\000\001\001\000\002chat_team ^clan 45319^-Jun-> tentem nao morrer a toa \000
  
  # \000?\000\000\206\275\000\000\225\000\000\000JJ\000\000\001\001\000\fchat ^clan 19141^Sas> ASGEEYASGEAYSEG \000
  
  # de \000\r ate \"
  # 
  # \377n\376Fearless#6
  # \377t\3761
  # \377o\3760
  # \377c\37645319
  # \377r\3760
  # \377x\3760
  # \377sep\3761002
  # \377g\376681418
  # \377u\376866851
  # \377sq\3760
  # \377ut\3760
  # \377i0\3760
  # \377i1\3760
  # \377i2\3760
  # \377i3\3760
  # \377i4\3760
  # \377i5\3760

  # chat_team  
end
