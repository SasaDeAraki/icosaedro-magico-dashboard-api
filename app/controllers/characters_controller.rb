class CharactersController < ApplicationController
  def show
    
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
      when "LANCER"
        [ :name,
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
    end
  end
end
