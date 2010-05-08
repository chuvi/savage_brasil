class ShoutsController < ApplicationController
  
  def create
    @shout = Shout.new(params[:shout])
    @shout.save
    redirect_to root_path
  end
  
end