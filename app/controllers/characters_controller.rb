class CharactersController < ApplicationController
  def show
    set_character

    render json: CharactersSerializer.render(@character, view: set_character_view)
  end

  private

  def set_character
    @character = Character.find(params[:id])
    if @character.blank?
      raise(ActiveRecord::RecordNotFound, "Personagem não encontrado")
    end
  end

  def character_params
    permitted = case campaign.system
    when "LANCER" [
      :name,
      :color,
      :flavor,
      :frame_model,
      :frame_name,
      :code_name,
      :total_pilot_hp,
      :total_frame_hp,
      :total_reactor,
      :heat_cap,
      :total_reactor
      ]
    when "DND5E" [
      :name,
      :color,
      :flavor,
      :total_hp
    ]
    when "ORDEM_PARANORMAL" [
      :name,
      :color,
      :flavor,
      :total_hp,
      :total_pe,
      :total_pd
    ]
    end

    params.require(:character).permit(permitted)
  end

  def set_chararcter_view
    case campaign.system
    when "LANCER", :lancer_char
    when "DND5E", :dnd_char
    when "ORDEM_PARANORMAL", :ordem_char
    end
  end
end
