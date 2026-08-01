class Campaign < ApplicationRecord
  has_many :campaigns_users
  has_many :users, through: :campaigns_users
  has_many :characters

  has_one_attached :cover

  RPG_SYSTEMS = [
    "LANCER",
    "DND5E",
    "ORDEM_PARANORMAL"
].freeze

  validates :name, presence: true
  validates :system, presence: true
  validates :active, inclusion: { in: [ true, false ] }

  attribute :system, default: "LANCER"
  attribute :active, default: true

  scope :active, -> { where(active: true) }

  def last_visited
    campaigns_users.order(last_visited: :desc).pick(:last_visited)
  end
end
