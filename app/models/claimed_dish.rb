class ClaimedDish < ActiveRecord::Base
  belongs_to :rsvp

  validates :rsvp_id, presence: true
  validates :yummly_id, presence: true
end