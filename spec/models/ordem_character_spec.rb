require 'rails_helper'

RSpec.describe OrdemCharacter, type: :model do
  let(:ordem_character) { create(:ordem_character) }

  describe "validations" do
    it { is_expected.to validate_presence_of(:total_hp) }
    it { is_expected.to validate_numericality_of(:total_hp).is_greater_than(0) }
    it "validates current_hp is between 0 and total_hp" do
      character = build(:ordem_character, current_hp: -1)

      expect(character).not_to be_valid
      expect(character.errors[:current_hp]).to be_present
    end

    it { is_expected.to validate_inclusion_of(:resource).in_array(%w[PE PD]) }

    context "when the resource is PE" do
      it "is valid with pe fields" do
        character = build(
          :ordem_character,
          resource: "PE",
          total_hp: 20,
          current_hp: 20,
          total_sanity: 15,
          current_sanity: 15,
          total_pe: 10,
          current_pe: 10,
          total_pd: nil,
          current_pd: nil
        )

        expect(character).to be_valid
      end
      it "is invalid with pd fields" do
        character = build(
          :ordem_character,
          resource: "PE",
          total_hp: 20,
          current_hp: 20,
          total_sanity: nil,
          current_sanity: nil,
          total_pe: nil,
          current_pe: nil,
          total_pd: 10,
          current_pd: 10
        )

        expect(character).to be_invalid
      end
    end

    context "when the resource is PD" do
      it "is valid with pd fields" do
        character = build(
          :ordem_character,
          resource: "PD",
          total_hp: 20,
          current_hp: 20,
          total_sanity: nil,
          current_sanity: nil,
          total_pe: nil,
          current_pe: nil,
          total_pd: 10,
          current_pd: 10
        )

        expect(character).to be_valid
      end
      it "is invalid with pe fields" do
        character = build(
          :ordem_character,
          resource: "PD",
          total_hp: 20,
          current_hp: 20,
          total_sanity: 15,
          current_sanity: 15,
          total_pe: 10,
          current_pe: 10,
          total_pd: nil,
          current_pd: nil
        )

        expect(character).to be_invalid
      end
    end
  end
end
