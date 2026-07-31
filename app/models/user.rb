class User < ApplicationRecord
  devise :omniauthable, omniauth_providers: [ :google_oauth2 ]

  has_many :campaigns_users
  has_many :campaigns, through: :campaigns_users

  validates :name,
    presence: true,
    length: { minimum: 2, maximum: 100 }

  validates :email,
    presence: true,
    uniqueness: { case_sensitive: false },
    format: {
      with: URI::MailTo::EMAIL_REGEXP
    }

  validates :uid,
    presence: true,
    uniqueness: { scope: :provider }

  validates :provider, presence: true

  validates :active,
    inclusion: { in: [ true, false ] }

  attribute :active, default: true

  scope :active, -> { where(active: true) }
end
