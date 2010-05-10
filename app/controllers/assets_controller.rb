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
      flash[:success] = "Imagem carregada com sucesso!"
      redirect_to assets_path
    else
      flash[:success] = "Ocorreu um erro ao efetuar o upload!"
      redirect_to assets_path
    end
  end
  
end