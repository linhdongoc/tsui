class User < ApplicationRecord
  devise :database_authenticatable, :lockable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  ## associations
  has_many :books, dependent: :destroy
  has_many :event_users, dependent: :destroy
  has_many :events, through: :event_users

  enum role: { usual: 0, employee: 1, admin: 2 }
  enum lang: Rails.configuration.i18n.available_locales
  enum salutation: { salutation_none: 0, female: 1, male: 2, various: 3 }

  validates :first_name, :last_name, :email, presence: true

  def name
    [first_name, last_name].compact.join(' ')
  end
end
