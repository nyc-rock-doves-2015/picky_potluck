class Party < ActiveRecord::Base
  has_many :rsvps
  has_many :users, through: :rsvps
  has_many :unregistered_email

  def combine_nonos
    @users = self.users
    @combined_nonos = []
    @users.each do |user|
      user.nonos.each do |nono|
        if @combined_nonos.any?{|n| n.name == nono.name}
          next
        else
          @combined_nonos << nono
        end
      end
    end
    @combined_nonos
  end

  def rsvp(user)
    Rsvp.find_by(party_id: self.id, user_id: user.id)
  end

  def upcoming?
    diff = date - Time.now
    if diff >= 0
      true
    else
      false
    end
  end

end
