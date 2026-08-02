FactoryBot.define do
  factory :character do
    association :user
    association :campaign

    name { "0, O Tolo" }
    color { "#FAFAFA" }
    flavor { "Quadro branco" }
    active { true }
  end

  factory :lancer_character, parent: :character, class: "LancerCharacter" do
    type { "LancerCharacter" }
    frame_model { "Everest" }
    frame_name { "Everest" }
    code_name { "Ace" }
    total_pilot_hp { 10 }
    current_pilot_hp { 10 }
    total_structure { 4 }
    current_structure { 4 }
    total_frame_hp { 20 }
    current_frame_hp { 20 }
    total_reactor { 4 }
    current_reactor { 4 }
    heat_cap { 5 }
    current_heat { 0 }
  end

  factory :dnd_character, parent: :character, class: "DndCharacter" do
    type { "DndCharacter" }
    total_hp { 20 }
    current_hp { 20 }
  end

  factory :ordem_character, parent: :character, class: "OrdemCharacter" do
    type { "OrdemCharacter" }
    total_hp { 20 }
    current_hp { 20 }
    total_sanity { 25 }
    current_sanity { 25 }
    resource { "PE" }
    total_pe { 10 }
    current_pe { 10 }
  end
end
