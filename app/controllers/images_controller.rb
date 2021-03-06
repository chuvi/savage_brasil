class ImagesController < ApplicationController
  
  before_filter lambda{ |c| c.send :menu, :images }
  
  def index
    @image = Image.new
    @images = Image.all
  end
  
  def show
    @image = Image.find(params[:id])
    @comment = Comment.new
  end
  
  def create
    @image = Image.new(params[:image])
    @image.user = current_user
    if @image.save
      flash[:upload] = "<div class='success rounded_4'>Imagem carregada com sucesso!</div><br/>"
      Event.create :kind => "create_image", :image => @image, :user => current_user
      redirect_to images_path
    else
      flash[:upload] = "<div class='error rounded_4'>Ocorreu um erro ao efetuar o upload!</div><br/>"
      @images = Image.all
      redirect_to images_path
      # render :index    # TODO
    end
  end
  
end