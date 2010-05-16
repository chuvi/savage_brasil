class MapsController < ApplicationController
  
  def index
    @menu = :map_list
    @maps = Map.all
  end
  
  def thumbs
    @menu = :map_thumbs
    @maps = Map.paginate :page => params[:page]
  end
  
end