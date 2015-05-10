class Rsvp < ActiveRecord::Base
  belongs_to :party
  belongs_to :user
  has_one :claimed_dish

  validates :party_id, presence: true
  validates :user_id, presence: true

  validates_uniqueness_of :user_id, :scope => [:party_id]
  validates_uniqueness_of :party_id, :scope => [:user_id]
end
