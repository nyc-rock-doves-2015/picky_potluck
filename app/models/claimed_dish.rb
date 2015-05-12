class ClaimedDish < ActiveRecord::Base
  belongs_to :rsvp

  validates :rsvp_id, presence: true
  validates :yummly_id, presence: true

  def self.find_for_party_and_user(party, user)
    joins(:rsvp).where('rsvps.user_id = ?', user.id).where('rsvps.party_id = ?', party.id)
  end
end