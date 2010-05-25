class Rating < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :rateable, :polymorphic => true
  
  validates_presence_of :vote
  validates_presence_of :user
  
  named_scope :bad,     :conditions => { :vote => 0 }
  named_scope :nothing, :conditions => { :vote => 1 }
  named_scope :good,    :conditions => { :vote => 2 }
  
end