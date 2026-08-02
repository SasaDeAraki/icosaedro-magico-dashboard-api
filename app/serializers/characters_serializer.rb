class CharactersSerializer < Blueprinter::Base
  view :complete do
    transform CamelCaseTransformer

    fields :id,
      :name,
      :color,
      :flavor,
      :active
    field :portrait do |character, _options|
      character.portrait.attached? ? Rails.application.routes.url_helpers.rails_blob_url(character.portrait) : nil
    end
  end

  view :id_portrait do
    transform CamelCaseTransformer

    field :id
    field :portrait do |character, _options|
      character.portrait.attached? ? Rails.application.routes.url_helpers.rails_blob_url(character.portrait) : nil
    end
  end
end
