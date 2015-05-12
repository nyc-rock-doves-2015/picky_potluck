class Party < ActiveRecord::Base
  has_many :rsvps
  has_many :users, through: :rsvps
  has_many :unregistered_email

  def combine_nonos
    @combined_nonos = self.users.inject([]){ |combined_nonos, user| combined_nonos | user.nonos }
    @combined_nonos
  end

  def rsvp(user)
    Rsvp.find_by(party_id: self.id, user_id: user.id)
  end

  def upcoming?
    diff = date - Time.now
    diff >= 0
  end

end
