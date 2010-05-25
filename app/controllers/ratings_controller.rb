class RatingsController < ApplicationController
  
  def create
    @map = Map.find(params[:map_id])
    @rating = @map.ratings.build params[:rating]
    @rating.user = current_user
    case params[:commit]
    when "Ruim"
      @rating.vote = 0
    when "Indiferente"
      @rating.vote = 1
    when "Bom"
      @rating.vote = 2
    end
    if @rating.save!
      flash[:rating] = "Seu voto foi registrado!"
    end
    redirect_to map_path(@map)
  end
  
  def destroy
    @rating = current_user.ratings.find(params[:id])
    @map = @rating.rateable
    @rating.destroy
    redirect_to map_path(@map)
  end
  
end