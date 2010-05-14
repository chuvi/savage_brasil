class ImagesController < ApplicationController
  
  def index
    @menu = :images
    @image = Image.new
    @images = Image.all
  end
  
  def create
    @menu = :images
    @image = Image.new(params[:image])
    @image.user = current_user
    if @image.save!
      flash[:upload] = "<div class='success rounded_4'>Imagem carregada com sucesso!</div><br/>"
      redirect_to images_path
    else
      flash[:upload] = "<div class='error rounded_4'>Ocorreu um erro ao efetuar o upload!</div><br/>"
      @images = Image.all
      redirect_to images_path
      # render :index    # TODO
    end
  end
  
end