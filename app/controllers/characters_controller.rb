class CharactersController < ApplicationController
  def show
    # CORRIGIR A PORRA DESSA VIEW PQ ESSE CARALHO TA RETORNANDO SO OS ATRIBUTO DE DND PRA UM PERSONAGEM DE LANCER SENDO QUE EU JA ALTEREI O CARALHO DO ID PORRA
    set_character

    render json: CharactersSerializer.render(@character, view: set_character_view)
  end

  def create
    character = Character.new(character_params)
    character.portrait.attach(params[:portrait]) if params[:portrait].present?

    if character.save
      render json: CharactersSerializer.render(character, view: set_character_view)
    end
  end

  def update
    set_character

    @character.update!(character_params)
    render json: CharactersSerializer.render(@character, view: set_character_view)
  end

  def destroy
    set_character

    @character.update!(active: false)
    render json: { id: @character.id }
  end

  private

  def set_character
    @character = Character.find(params[:id])
    if @character.blank?
      raise(ActiveRecord::RecordNotFound, "Personagem não encontrado")
    end
  end

  def character_params
    set_character

    permitted = case @character.campaign.system
    when "LANCER"
      attributes = [
      :name,
      :color,
      :flavor,
      :frame_model,
      :frame_name,
      :code_name,
      :total_pilot_hp,
      :current_pilot_hp,
      :total_frame_hp,
      :current_frame_hp,
      :total_reactor,
      :current_reactor,
      :heat_cap,
      :current_heat
      ]
    when "DND5E"
      attributes = [
      :name,
      :color,
      :flavor,
      :total_hp
    ]
    when "ORDEM_PARANORMAL"
      attributes = [
      :name,
      :color,
      :flavor,
      :total_hp,
      :total_sanity,
      :resource,
      :total_pe,
      :total_pd
    ]
    end

    params.require(:character).permit(attributes)
  end

  def set_character_view
    set_character

    case @character.campaign.system
    when "LANCER"
      :lancer_character
    when "DND5E"
      :dnd_character
    when "ORDEM_PARANORMAL"
      :ordem_character
    end
  end
end
