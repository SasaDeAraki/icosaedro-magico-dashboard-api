class Campaign < ApplicationRecord
  has_many :campaigns_users
  has_many :user, through: :campaigns_users

  has_one_attached :cover

  RPG_SYSTEMS = [
    "LANCER",
    "DND5E",
    "ORDEM_PARANORMAL"
].freeze

  validates :name, presence: true

  validates :system, presence: true

  validates :active, presence: true

  attribute :system, default: "LANCER"

  attribute :active, default: true

  scope :active, -> { where(active: true) }
end
