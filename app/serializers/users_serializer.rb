class UsersSerializer < Blueprinter::Base
  view :complete do
    transform CamelCaseTransformer

    fields :id,
      :name,
      :email,
      :uid,
      :provider,
      :active
    field :portrait, method: :portrait_url
  end

  view :id_name do
    transform CamelCaseTransformer

    fields :id, :name
  end

  private

  def portrait_url
    object.portrait.attached? ? Rails.application.routes.url_helpers.rails_blob_url(object.portrait) : nil
  end
end
