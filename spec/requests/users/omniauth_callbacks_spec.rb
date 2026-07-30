require "rails_helper"

RSpec.describe "Users::OmniauthCallbacks", type: :request do
  before do
    @previous_frontend_url = ENV["FRONTEND_URL"]
    ENV["FRONTEND_URL"] = "http://frontend.test"
  end

  after do
    ENV["FRONTEND_URL"] = @previous_frontend_url
  end

  describe "POST /users/auth/google_oauth2/callback" do
    it "creates or finds the user and redirects to the frontend callback" do
      auth_hash = OmniAuth::AuthHash.new(
        provider: "google_oauth2",
        uid: "1234567890",
        info: {
          email: "user@example.com",
          name: "Test User"
        }
      )

      post "/users/auth/google_oauth2/callback", env: { "omniauth.auth" => auth_hash }

      expect(response).to have_http_status(:found)
      expect(response).to redirect_to("http://frontend.test/auth/callback")

      user = User.find_by(provider: "google_oauth2", uid: "1234567890")
      expect(user).to be_present
      expect(user.email).to eq("user@example.com")
      expect(user.name).to eq("Test User")
    end

    it "returns unauthorized when OmniAuth fails" do
      OmniAuth.config.mock_auth[:google_oauth2] = :invalid_credentials

      post "/users/auth/google_oauth2/callback"

      expect(response).to have_http_status(:unauthorized)
      expect(response.parsed_body).to eq("error" => "OAuth authentication failed")
    end
  end
end
