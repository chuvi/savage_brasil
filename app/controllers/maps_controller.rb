class MapsController < ApplicationController
  
  def index
    @menu = :map_list
    @maps = Map.all
  end
  
  def thumbs
    @menu = :map_thumbs
    @maps = Map.paginate :page => params[:page]
  end
  
  def show
    @menu = :map_list
    @map = Map.find(params[:id])
    @comment = Comment.new
    @rating = @map.ratings.find_by_user_id(current_user) || Rating.new
  end
  
end