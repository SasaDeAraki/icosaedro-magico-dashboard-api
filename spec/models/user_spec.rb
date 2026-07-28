# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do
  it "validates user attributes" do
    subject { create(:user) }

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_prsence_of(:passwordHash) }
  end
end
