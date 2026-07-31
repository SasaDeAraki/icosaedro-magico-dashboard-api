class CampaignsSerializer < Blueprinter::Base
  view :card do
    transform CamelCaseTransformer

    fields :name, :system
    field :cover, method: :cover_url
    field :last_visited
  end

  view :complete do
    transform CamelCaseTransformer

    fields :name, :system, :last_visited
    field :cover, method: :cover_url
  end

  private

  def cover_url
    object.cover.attached? ? Rails.application.routes.url_helpers.rails_blob_url(object.cover) : nil
  end
end
