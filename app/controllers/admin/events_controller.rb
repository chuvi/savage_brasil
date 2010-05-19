class Admin::EventsController < ApplicationController

  def index
    @events = Event.find_by_kind("announcement")
  end
  
  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(params[:event])
    @event.kind = "announcement"
    if @event.save
      flash[:notice] = "Evento criado com sucesso!"
      redirect_to root_path
    end
  end
  
end