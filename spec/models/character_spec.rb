require 'rails_helper'

RSpec.describe Character, type: :model do
  subject { create(:character) }
  describe "associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:campaign) }
  end
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe "defaults" do
    let(:character) { create(:character) }
    it "defaults active to true" do
      expect(character.active).to be true
    end
  end

  describe LancerCharacter do
    it "creates a lancer character" do
      character = create(:lancer_character)

      expect(character).to be_a(LancerCharacter)
      expect(character.type).to eq("LancerCharacter")
    end
  end

  describe DndCharacter do
    it "creates a dnd character" do
      character = create(:dnd_character)

      expect(character).to be_a(DndCharacter)
      expect(character.type).to eq("DndCharacter")
    end
  end

  describe OrdemCharacter do
    it "creates a ordem character" do
      character = create(:ordem_character)

      expect(character).to be_a(OrdemCharacter)
      expect(character.type).to eq("OrdemCharacter")
    end
  end
end
