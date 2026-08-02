require 'rails_helper'

RSpec.describe "Characters", type: :request do
  describe "GET /characters/:id" do
    let(:user) { create(:user) }

    before do
      login_as(user, scope: :user)
    end

    it "returns lancer character attributes" do
      campaign = create(:campaign, system: "LANCER")
      character = create(:lancer_character, user: user, campaign: campaign)

      get "/characters/#{character.id}"

      expect(response).to have_http_status(:ok)
      expect(response.parsed_body).to include(
        "id" => character.id,
        "name" => character.name,
        "frameModel" => character.frame_model
      )
    end

    it "returns dnd character attributes" do
      campaign = create(:campaign, system: "DND5E")
      character = create(:dnd_character, user: user, campaign: campaign)

      get "/characters/#{character.id}"

      expect(response).to have_http_status(:ok)
      expect(response.parsed_body).to include(
        "id" => character.id,
        "name" => character.name,
        "totalHp" => character.total_hp
      )
    end

    it "returns ordem character attributes" do
      campaign = create(:campaign, system: "ORDEM_PARANORMAL")
      character = create(:ordem_character, user: user, campaign: campaign)

      get "/characters/#{character.id}"

      expect(response).to have_http_status(:ok)
      expect(response.parsed_body).to include(
        "id" => character.id,
        "name" => character.name,
        "totalSanity" => character.total_sanity
      )
    end
  end
end
