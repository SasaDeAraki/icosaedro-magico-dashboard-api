class CampaignsSerializer < Blueprinter::Base
  view :complete do
    transform CamelCaseTransformer

    fields :id,
      :name,
      :system

    field :cover do |campaign, _options|
      campaign.cover.attached? ? Rails.application.routes.url_helpers.rails_blob_url(campaign.cover) : nil
    end
    field :last_visited do |campaign|
      campaign.last_visited&.utc&.iso8601(3)
    end

    association :users, blueprint: UsersSerializer, view: :id_name
    association :characters, blueprint: CharactersSerializer, view: :complete
  end

  view :card do
    transform CamelCaseTransformer

    fields :id,
      :name,
      :system

    field :cover do |campaign, _options|
      campaign.cover.attached? ? Rails.application.routes.url_helpers.rails_blob_url(campaign.cover) : nil
    end
    field :last_visited do |campaign|
      campaign.last_visited&.utc&.iso8601(3)
    end
  end

  view :campaign_characters do
    transform CamelCaseTransformer

    field :system

    association :characters, blueprint: CharactersSerializer, view: :id_portrait
  end
end
