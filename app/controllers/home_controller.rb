class HomeController < ApplicationController
  
  skip_before_filter :require_user    # don't need authentication
  
  def index
    @shout = Shout.new
    @shouts = Shout.all
    @user_session = UserSession.new
  end
  
end
