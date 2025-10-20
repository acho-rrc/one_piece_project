# app/controllers/ships_controller.rb
class ShipsController < ApplicationController
  def index
    @ships = Ship.includes(:crew).order(:name)
  end

  def show
    @ship = Ship.includes(:crew).find(params[:id])
  end
end
