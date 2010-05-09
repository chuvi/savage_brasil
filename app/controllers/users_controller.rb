class UsersController < ApplicationController
  
  skip_before_filter :require_user, :only => [:new, :create]
  before_filter { |controller| controller.send :menu, :home }
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "#{@user.login}, bem vindo ao Savage Brasil!"
      redirect_to user_path(@user)
    else
      @users = User.all
      render :new
    end
  end
  
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:success] = "Conta atualizada com sucesso"
      redirect_to root_path
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