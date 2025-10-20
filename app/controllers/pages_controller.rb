class PagesController < ApplicationController
  def home
    @crews = Crew.order(:name)
    @roles = Pirate::ROLES

    @pirates = Pirate.all
                     .by_crew(params[:crew_id])
                     .by_role(params[:role])
                     .with_devil_fruit(params[:fruit])
                     .bounty_min(params[:min_bounty])
                     .bounty_max(params[:max_bounty])
                     .search(params[:q])
                     .by_bounty_desc
                     .page(params[:page]).per(15)
  end

  def about; end
end
