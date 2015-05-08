class Rsvp < ActiveRecord::Base
  belongs_to :party
  belongs_to :user

  validates_uniqueness_of :user_id, :scope => [:party_id]
  validates_uniqueness_of :party_id, :scope => [:user_id]
end
