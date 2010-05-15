class ShoutsController < ApplicationController
  
  def index
    @menu = :home
    @shouts = Shout.all :order => "created_at DESC"
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
  
  def destroy
    @shout = current_user.shouts.find(params[:id])
    if @shout.destroy
      flash[:shout] = "<div class='success rounded_4'>Post excluído</div><br/>"
    else
      flash[:shout] = "<div class='success rounded_4'>Erro ao excluir o post</div><br/>"
    end
    redirect_to root_path
  end
  
end