class CampaignsController < ApplicationController
  def index
    campaigns = current_user.campaigns.active

    render json: CampaignsSerializer.render(campaigns, view: :card)
  end

  def show
    set_campaign

    render json: CampaignsSerializer.render(@campaign, view: :campaign_characters)
  end

  def create
    campaign = Campaign.new(campaign_params)
    campaign.cover.attach(params[:cover]) if params[:cover].present?

    if campaign.save
      render json: CampaignsSerializer.render(campaign, view: :complete)
    end
  end

  def update
    set_campaign

    @campaign.update!(campaign_params)
    render json: CampaignsSerializer.render(@campaign, view: :complete)
  end

  def destroy
    set_campaign

    @campaign.update!(active: false)
    render json: { id: @campaign.id }
  end

  private

  def set_campaign
    @campaign = Campaign.find(params[:id])
    if @campaign.blank?
      raise(ActiveRecord::RecordNotFound, "Mesa não encontrada")
    end
  end

  def campaign_params
    params.require(:campaign).permit(:name, :system, :cover)
  end
end
