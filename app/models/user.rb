class User < ApplicationRecord
  has_secure_password

  ## Relationships
  has_many :books
  has_many :event_users, dependent: :destroy
  has_many :events, through: :event_users
end
