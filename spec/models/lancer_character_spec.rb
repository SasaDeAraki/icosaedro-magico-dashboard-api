require 'rails_helper'

RSpec.describe LancerCharacter, type: :model do
  let(:lancer_character) { create(:lancer_character) }
  describe "validations" do
    it { is_expected.to validate_presence_of(:total_pilot_hp) }
    it { is_expected.to validate_numericality_of(:total_pilot_hp).is_greater_than(0) }
    it "validates current_pilot_hp is between 0 and total_pilot_hp" do
      character = build(:lancer_character, current_pilot_hp: -1)

      expect(character).not_to be_valid
      expect(character.errors[:current_pilot_hp]).to be_present
    end

    it { is_expected.to validate_numericality_of(:total_structure).is_greater_than(0) }
    it "validates current_structure is between 0 and total_structure" do
      character = build(:lancer_character, current_structure: -1)

      expect(character).not_to be_valid
      expect(character.errors[:current_structure]).to be_present
    end

    it { is_expected.to validate_presence_of(:total_frame_hp) }
    it { is_expected.to validate_numericality_of(:total_frame_hp).is_greater_than(0) }
    it "validates current_frame_hp is between 0 and total_frame_hp" do
      character = build(:lancer_character, current_frame_hp: -1)

      expect(character).not_to be_valid
      expect(character.errors[:current_frame_hp]).to be_present
    end

    it { is_expected.to validate_numericality_of(:total_reactor).is_greater_than(0) }
    it "validates current_reactor is between 0 and total_reactor" do
      character = build(:lancer_character, current_reactor: -1)

      expect(character).not_to be_valid
      expect(character.errors[:current_reactor]).to be_present
    end

    it { is_expected.to validate_presence_of(:heat_cap) }
    it { is_expected.to validate_numericality_of(:heat_cap).is_greater_than(0) }
    it "validates current_heat is between 0 and heat_cap" do
      character = build(:lancer_character, current_heat: -1)

      expect(character).not_to be_valid
      expect(character.errors[:current_heat]).to be_present
    end
  end

  describe "defaults" do
    it "defaults total_structure to 4" do
      character = create(:lancer_character)

      expect(character.total_structure).to be 4
    end
    it "defaults current_structure to 4" do
      character = create(:lancer_character)

      expect(character.current_structure).to be 4
    end
    it "defaults total_reactor to 4" do
      character = create(:lancer_character)

      expect(character.total_reactor).to be 4
    end
    it "defaults current_reactor to 4" do
      character = create(:lancer_character)

      expect(character.current_reactor).to be 4
    end
  end
end
