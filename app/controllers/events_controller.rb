class EventsController < ApplicationController
  
  def index
    @events = Event.all :limit => 10
  end
  
end