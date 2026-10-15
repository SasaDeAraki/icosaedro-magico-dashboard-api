class UsersSerializer < Blueprinter::Base
  view :complete do
    transform CamelCaseTransformer

    fields :id,
      :name,
      :email,
      :uid,
      :provider,
      :active
    field :portrait do |user, _options|
      user.portrait.attached? ? Rails.application.routes.url_helpers.rails_blob_url(user.portrait) : nil
    end
  end

  view :id_name do
    transform CamelCaseTransformer

    fields :id, :name
  end
end
