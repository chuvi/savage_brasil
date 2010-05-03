class UserSessionsController < ApplicationController
  
  skip_before_filter :require_user
  
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy
  
  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:success] = "Login successful!"
      @user = User.find_by_login(@user_session.login)  # can't use current_user here yet
      # AppLogger.info "user '#{@user.login}' succefully logged in"
      redirect_to root_path
    else
      AppLogger.warn "Log in failed for '#{params[:user_session][:login]}'"
      render :action => :new
    end
  end
  
  def destroy
    current_user_session.destroy
    flash[:success] = "Logout successful!"
    redirect_to root_path
  end
end