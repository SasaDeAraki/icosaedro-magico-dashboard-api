require 'rails_helper'

RSpec.describe DndCharacter, type: :model do
  let(:dnd_character) { create(:dnd_character) }

  describe "validations" do
    it { is_expected.to validate_presence_of(:total_hp) }
    it { is_expected.to validate_numericality_of(:total_hp).is_greater_than(0) }
    it "validates current_hp is between 0 and total_hp" do
      character = build(:dnd_character, current_hp: -1)

      expect(character).not_to be_valid
      expect(character.errors[:current_hp]).to be_present
    end
  end
end
