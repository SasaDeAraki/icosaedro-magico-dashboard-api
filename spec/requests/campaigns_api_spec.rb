require "rails_helper"

RSpec.describe "Campaigns", type: :request do
  describe "GET /campaigns" do
    context "when user is authenticated" do
      let(:auth_user) { create(:user) }
      let(:other_user) { create(:user) }

      before do
        login_as(auth_user, scope: :user)
      end

      it "returns user campaigns" do
        campaign1 = create(:campaign)
        campaign2 = create(:campaign)
        other_campaign = create(:campaign)

        attach_cover!(campaign1)
        attach_cover!(campaign2)

        create(:campaigns_user, campaign: campaign1, user: auth_user)
        create(:campaigns_user, campaign: campaign2, user: auth_user)
        create(:campaigns_user, campaign: other_campaign, user: other_user)

        get "/campaigns"

        expect(response).to have_http_status(:ok)
        expect(response.parsed_body.map(&:deep_symbolize_keys)).to eq(
          [
            {
              id: campaign1.id,
              name: campaign1.name,
              system: campaign1.system,
              cover: get_cover_url(campaign1),
              lastVisited: campaign1.last_visited.iso8601(3)
            },
            {
              id: campaign2.id,
              name: campaign2.name,
              system: campaign2.system,
              cover: get_cover_url(campaign2),
              lastVisited: campaign2.last_visited.iso8601(3)
            }
          ]
        )
      end
    end

    context "when user is not authenticated" do
      let(:unauth_user) { create(:user) }

      it "redirects to root" do
        campaign1 = create(:campaign)
        campaign2 = create(:campaign)

        attach_cover!(campaign1)
        attach_cover!(campaign2)

        create(:campaigns_user, campaign: campaign1, user: unauth_user)
        create(:campaigns_user, campaign: campaign2, user: unauth_user)

        get "/campaigns"

        expect(response).to have_http_status(:found)
        expect(response).to redirect_to("/")
      end
    end
    def attach_cover!(campaign)
      campaign.cover.attach(
        io: StringIO.new("cover"),
        filename: "#{campaign.id || SecureRandom.hex(4)}.png",
        content_type: "image/png"
      )
    end

    def get_cover_url(campaign)
      Rails.application.routes.url_helpers.rails_blob_url(campaign.cover)
    end
  end
end
