class HomeController < ApplicationController
  
  skip_before_filter :require_user    # don't need authentication
  
  def index
  end
  
end
