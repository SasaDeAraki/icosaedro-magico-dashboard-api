# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  password        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#  active          :boolean
#

class User < ApplicationRecord
  has_secure_password

  validates :name,
    presence: true,
    length: { minimun: 2, maximum: 100 }

  validates :email,
    presence: true,
    uniqueness: { case_sensitive: false },
    format: {
      with: URI::MailTo::EMAIL_REGEXP
    }

  validates :password,
    length: { minimum: 8, maximum: 72 },
    allow_nil: true
end
