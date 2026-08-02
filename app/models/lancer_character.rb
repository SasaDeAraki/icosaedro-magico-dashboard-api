class LancerCharacter < Character
  validates :total_pilot_hp, presence: true, numericality: { greater_than: 0 }
  validates :current_pilot_hp, presence: true, numericality: {
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: ->(character) { character.total_pilot_hp }
  }

  validates :total_structure, presence: true, numericality: { greater_than: 0 }
  validates :current_structure, presence: true, numericality: {
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: ->(character) { character.total_structure }
  }

  validates :total_frame_hp, presence: true, numericality: { greater_than: 0 }
  validates :current_frame_hp, presence: true, numericality: {
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: ->(character) { character.total_frame_hp }
  }

  validates :total_reactor, presence: true, numericality: { greater_than: 0 }
  validates :current_reactor, presence: true, numericality: {
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: ->(character) { character.total_reactor }
  }

  validates :heat_cap, presence: true, numericality: { greater_than: 0 }
  validates :current_heat, presence: true, numericality: {
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: ->(character) { character.heat_cap }
  }

  attribute :total_structure, default: 4
  attribute :current_structure, default: 4
  attribute :total_reactor, default: 4
  attribute :current_reactor, default: 4
end
