class OrdemCharacter < Character
  validates :resource, inclusion: { in: %w[PE PD] }

  validates :total_pd, presence: true, numericality: { greater_than: 0 },
    if: -> { self.resource === "PD" }
  validates :current_pd, presence: true, numericality: {
    greater_than_or_equals_to: 0,
    less_than_or_equal_to: ->(character) { character.total_pd }
  }, if: -> { self.resource === "PD" }

  validates :total_pe, presence: true, numericality: { greater_than: 0 },
    if: -> { self.resource === "PE" }
  validates :current_pe, presence: true, numericality: {
    greater_than_or_equals_to: 0,
    less_than_or_equal_to: ->(character) { character.total_pe }
  }, if: -> { self.resource === "PE" }
end
