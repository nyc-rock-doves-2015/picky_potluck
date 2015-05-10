class ClaimedDish < ActiveRecord::Base
  belongs_to :rsvp

  validates :yummly_id, presence: true
end