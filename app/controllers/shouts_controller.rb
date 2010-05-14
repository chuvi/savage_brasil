class ShoutsController < ApplicationController
  
  def index
    @menu = :home
    @shouts = Shout.all, :order => "created_at DESC"
  end
  
  def create
    @shout = Shout.new(params[:shout])
    @shout.user = current_user
    if @shout.save
      redirect_to root_path
    else
      @shouts = Shout.all :limit => 5, :order => "created_at DESC"
      render "home/index"
    end
  end
  
end