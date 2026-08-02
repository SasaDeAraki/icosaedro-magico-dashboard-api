class DndCharacter < Character
  validates :total_hp, presence: true, numericality: { greater_than: 0 }
  validates :current_hp, presence: true, numericality: {
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: ->(character) { character.total_hp }
  }
end
