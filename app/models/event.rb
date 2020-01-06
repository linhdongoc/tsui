class Event < ApplicationRecord
  ## Relationships
  has_many :event_users, dependent: :destroy
  has_many :users, through: :event_users
  has_many :organizers, ->{ where(role: 'organizer' )}, through: :event_users
  has_many :attendees, ->{ where(role: 'attendee' )}, through: :event_users

  serialize :categories, Array

  accepts_nested_attributes_for :event_users, reject_if: :reject_event_users?, allow_destroy: true

  def reject_event_users?(attrs)
    attrs.slice(:id, :user_id, :role).values.all?(&:blank?)
  end
end
