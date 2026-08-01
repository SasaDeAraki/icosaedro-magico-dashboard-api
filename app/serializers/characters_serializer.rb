class CharactersSerializer < Blueprinter::Base
  view :complete do
    transform CamelCaseTransformer

    fields :id,
      :name,
      :color,
      :flavor,
      :active
    field :portrait, method: :portrait_url
  end

  view :id_portrait do
    transform CharactersSerializer

    field :id
    field :portrait, method: :portrait_url
  end

  private

  def portrait_url
    object.portrait.attached? ? Rails.application.routes.url_helpers.rails_blob_url(object.portrait) : nil
  end
end
