class PiratesController < ApplicationController
  before_action :set_pirate, only: %i[ show edit update destroy ]

  def index
    @crews  = Crew.order(:name)
    @roles  = Pirate::ROLES
    @pirates = Pirate.all
                     .by_crew(params[:crew_id])
                     .by_role(params[:role])
                     .with_devil_fruit(params[:fruit])
                     .bounty_min(params[:min_bounty])
                     .bounty_max(params[:max_bounty])
                     .search(params[:q])
                     .by_bounty_desc
                     .page(params[:page]).per(25)   # 👈 pagination
  end

  def show; end
  def new  ; @pirate = Pirate.new ; end
  def edit ; end

  def create
    @pirate = Pirate.new(pirate_params)
    if @pirate.save
      redirect_to @pirate, notice: "Pirate was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @pirate.update(pirate_params)
      redirect_to @pirate, notice: "Pirate was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @pirate.destroy!
    redirect_to pirates_url, notice: "Pirate was successfully destroyed."
  end

  private

  def set_pirate
    @pirate = Pirate.find(params[:id])
  end

  def pirate_params
    params.require(:pirate).permit(:name, :role, :bounty, :crew_id, :devil_fruit, :quote)
  end
end
