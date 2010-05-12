class AssetsController < ApplicationController
  
  def index
    @menu = :assets
    @asset = Asset.new
    @assets = Asset.all
  end
  
  def create
    @asset = Asset.new(params[:asset])
    @asset.user = current_user
    if @asset.save
      flash[:upload] = "<div class='success rounded_4'>Imagem carregada com sucesso!</div>"
      redirect_to assets_path
    else
      flash[:upload] = "<div class='error rounded_4'>Ocorreu um erro ao efetuar o upload!</div>"
      redirect_to assets_path
    end
  end
  
end