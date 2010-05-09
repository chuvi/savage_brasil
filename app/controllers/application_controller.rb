class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  before_filter :store_location

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  helper_method :current_user_session, :current_user, :back_path_or
  filter_parameter_logging :password, :password_confirmation
  

  private
    
    def menu(_menu)
      @menu = _menu
    end

    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end

    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.record
    end

    def require_user
      unless current_user
        store_location
        flash[:notice] = "You must be logged in to access this page"
        redirect_to new_user_session_url
        return false
      end
    end

    def require_no_user
      if current_user
        store_location
        flash[:notice] = "You must be logged out to access this page"
        redirect_to root_path
        return false
      end
    end

    # default parameter is necessary because the page can be accessed directly,
    # for example, through a bookmark
    def back_path_or(default)
      session[:back_path] || default
    end
  
    def store_location
      if request.request_method == :get && session[:last] != request.request_uri
        session[:back_path] = session[:last]
        session[:last] = request.request_uri
      end
    end
    

    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end

end
