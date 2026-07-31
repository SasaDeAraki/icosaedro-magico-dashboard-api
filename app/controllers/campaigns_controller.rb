class CampaignsController < ApplicationController
  def index
    campaigns = Campaign.active

    render json: CampaignsSerializer.render(campaigns, view: :card)
  end

  def create
    campaign = Campaign.new(campaign_params)
    campaign.cover.attach(params[:cover]) if params[:cover].present?

    if campaign.save
      render json: CampaignsSerializer.render(campaign, view: :complete)
    end
  end

  private

  def set_campaign
    @campaign = Campaign.find(params[:campaign_id])
    if @campaign.blank?
      raise(ActiveRecord::RecordNotFound, "Mesa não encontrada")
    end
  end

  def campaign_params
    params.require(:campaign).permit(:name, :system, :cover)
  end
end
