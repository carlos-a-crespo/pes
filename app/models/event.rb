class Event < ApplicationRecord
  belongs_to :event_type

  validates :title, presence: true, allow_blank: false
  validates :start, presence: true
  validates :end, presence: true, date: { after: :start }
end