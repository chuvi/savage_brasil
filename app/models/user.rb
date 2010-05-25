class User < ActiveRecord::Base
  
  validates_presence_of :name
  
  has_many :shouts
  has_many :assets # necessary?
  has_many :demos
  has_many :images
  has_many :comments
  has_many :ratings
  
  # the configuration block is optional, see authlogic docs for more configurations
  acts_as_authentic do |c|
    # c.validate_email_field = false
  end
  
end
