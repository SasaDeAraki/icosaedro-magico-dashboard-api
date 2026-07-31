class CampaignsSerializer < Blueprinter::Base
  view :complete do
    transform CamelCaseTransformer

    fields :id,
      :name,
      :system,
      :last_visited
    field :cover, method: :cover_url

    association :users, blueprint: UsersSerializer, view: :id_name
    association :characters, blueprint: CharactersSerializer, view: :complete
  end

  view :card do
    transform CamelCaseTransformer

    fields :id,
      :name,
      :system
    field :cover, method: :cover_url
    field :last_visited
  end

  view :campaign_characters do
    transform CamelCaseTransformer

    field :system

    association :characters, blueprint: CharactersSerializer, view: :id_portrait
  end

  private

  def cover_url
    object.cover.attached? ? Rails.application.routes.url_helpers.rails_blob_url(object.cover) : nil
  end
end
