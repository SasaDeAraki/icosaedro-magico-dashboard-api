class CharactersSerializer < Blueprinter::Base
  view :base_attributes do
    fields :id,
      :name,
      :color,
      :flavor,
      :active
    field :portrait do |character, _options|
      character.portrait.attached? ? Rails.application.routes.url_helpers.rails_blob_url(character.portrait) : nil
    end
  end

  view :lancer_character do
    transform CamelCaseTransformer
      include_view :base_attributes
      fields :frame_model,
        :frame_name,
        :code_name,
        :total_pilot_hp,
        :current_pilot_hp,
        :total_structure,
        :current_structure,
        :total_frame_hp,
        :current_frame_hp,
        :total_reactor,
        :current_reactor,
        :heat_cap,
        :current_heat
  end

  view :dnd_character do
    transform CamelCaseTransformer
      include_view :base_attributes
      fields :total_hp, :current_hp
  end

  view :ordem_character do
    transform CamelCaseTransformer
      include_view :base_attributes
      fields :total_hp,
        :current_hp,
        :total_sanity,
        :current_sanity,
        :resource,
        :total_pe,
        :current_pe,
        :total_pd,
        :current_pd
  end

  view :id_portrait do
    transform CamelCaseTransformer

    field :id
    field :portrait do |character, _options|
      character.portrait.attached? ? Rails.application.routes.url_helpers.rails_blob_url(character.portrait) : nil
    end
  end

  view :id_name do
    transform CamelCaseTransformer
    fields :id, :name
  end
end
