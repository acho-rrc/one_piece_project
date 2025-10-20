# app/controllers/crews_controller.rb
class CrewsController < ApplicationController
  def index
    @crews = Crew.includes(:ship).order(:name)
  end

  def show
    @crew = Crew.includes(:ship, :pirates).find(params[:id])
  end
end
