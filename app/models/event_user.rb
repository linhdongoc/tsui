class EventUser < ApplicationRecord
  ## Relationships
  belongs_to :event
  belongs_to :user

  ## Validators
  with_options presence: true do |r|
    r.validates :role
    r.validates :event_id
    r.validates :user_id
  end
end
