class CampaignsSerializer < Blueprinter::Base
  view :card do
    transform CamelCaseTransformer

    fields :name, :system
    field :cover_url
  end

  view :complete do
    transform CamelCaseTransformer

    fields :name, :system
    field :cover_url

    association :campaigns_users, blueprint: CampaignsUsersSerializer, view: :last_visited
  end

  private

  def cover_url
    object.cover.attached? ? Rails.application.routes.url_helpers.rails_blob_url(object.cover) : nil
  end
end
