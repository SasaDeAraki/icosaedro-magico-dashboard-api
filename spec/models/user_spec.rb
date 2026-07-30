# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  password        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#  active          :boolean
#

# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do
  subject { create(:user) }
  describe "validations" do
    it { is_expected.to have_many(:campaigns_users) }
    it { is_expected.to have_many(:campaign).through(:campaigns_users) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:uid) }
    it { is_expected.to validate_presence_of(:provider) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it { is_expected.to validate_uniqueness_of(:uid).scoped_to(:provider) }
  end

  describe "active" do
    let(:user) { create(:user) }

    context "when user is created" do
      it "active is true" do
        expect(user.active).to be true
      end
    end

    context "when active is false" do
      it "is valid" do
        user = build(:user, active: false)

        expect(user).to be_valid
      end
    end
  end
end
