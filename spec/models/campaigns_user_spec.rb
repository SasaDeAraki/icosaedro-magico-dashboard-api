require 'rails_helper'

RSpec.describe CampaignsUser, type: :model do
    it { is_expected.to belong_to(:campaign) }
    it { is_expected.to belong_to(:user) }
end
