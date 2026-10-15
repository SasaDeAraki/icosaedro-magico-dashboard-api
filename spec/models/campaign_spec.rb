require 'rails_helper'

RSpec.describe Campaign, type: :model do
  subject { create(:campaign) }

  describe "validations" do
    it { is_expected.to have_many(:campaigns_users) }
    it { is_expected.to have_many(:users).through(:campaigns_users) }
    it { should have_one_attached(:cover) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:system) }
  end

  describe "active" do
    let(:campaign) { create(:campaign) }

    context "when campaign is created" do
      it "active is true" do
        expect(campaign.active).to be true
      end
    end
  end

  describe "RPGS_SYSTEMS" do
    it "contains expected systems" do
      expect(Campaign::RPG_SYSTEMS).to include("LANCER")
      expect(Campaign::RPG_SYSTEMS).to include("DND5E")
      expect(Campaign::RPG_SYSTEMS).to include("ORDEM_PARANORMAL")
    end
  end
end
