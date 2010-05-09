class User < ActiveRecord::Base
  
  validates_presence_of :name
  
  has_many :shouts
  
  # the configuration block is optional, see authlogic docs for more configurations
  acts_as_authentic do |c|
    # c.validate_email_field = false
  end
  
end
