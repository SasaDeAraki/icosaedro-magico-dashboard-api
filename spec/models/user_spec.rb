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
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it do
      is_expected.to validate_length_of(:password)
        .is_at_least(8)
        .is_at_most(72)
    end
  end

  describe "password" do
    it "requires on create" do
      user = User.new(
        name: "Samuel",
        email: "samuel@email.com"
      )

      expect(user).to_not be_valid
      expect(user.errors[:password])
    end
  end

  describe "updating without password" do
    let!(:user) do
      create(
        :user,
        password: "12345678",
        password_confirmation: "12345678"
      )
    end

    it "allows updating other attributes without changing the password" do
      expect(
        user.update!(name: "Novo nome")
      ).to be true
    end
  end

  describe "password length" do
    let(:user) { create(:user) }

    it "does not allow short password" do
      user.password = "123"

      expect(user).not_to be_valid
      expect(user.errors[:password]).to include(
        "is too short (minimum is 8 characters)"
      )
    end

    it "accepts valid password" do
      user = build(
        :user,
        password: "12345678",
        password_confirmation: "12345678"
      )

      expect(user).to be_valid
    end
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
