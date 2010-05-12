class DemosController < ApplicationController
  
  def index
    @menu = :demos
    @demo = Demo.new
    @demos = Demo.all
  end
  
  def create
    @menu = :demos
    @demo = Demo.new(params[:demo])
    @demo.user = current_user
    if @demo.save!
      flash[:upload] = "<div class='success rounded_4'>Demo carregado com sucesso!</div>"
      redirect_to demos_path
    else
      flash[:upload] = "<div class='error rounded_4'>Ocorreu um erro ao efetuar o upload!</div>"
      @demos = Demo.all
      redirect_to demos_path
      # render :index    # TODO
    end
  end
  
end
