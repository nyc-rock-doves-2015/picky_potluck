class Rsvp < ActiveRecord::Base
  belongs_to :party
  belongs_to :user
  has_one :claimed_dish

  validates :party_id, presence: true
  validates :user_id, presence: true

  validates :user_id, uniqueness: {scope: :party_id, message: "rsvp must be unique"}
  validates :party_id, uniqueness: {scope: :user_id, message: "rsvp must be unique"}


  def claimed_dish
    ClaimedDish.find_by(rsvp_id: self.id)
  end
end
