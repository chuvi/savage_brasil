class Admin::UsersController < ApplicationController
  
  layout "admin"
  before_filter { |c| c.send(:menu, "users") }
  
  def new
    @user = User.new
  end
  
  def index
    @users = User.all
  end
  
  def create
    @menu = "users"
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Created user #{@user.email}"
      redirect_to admin_users_path
    else
      @users = User.all
      render :new
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "User succefully updated"
      redirect_to admin_users_path
    else
      @users = User.all
      render :edit
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:success] = "User deleted."
      redirect_to admin_users_path
    end
  end

end