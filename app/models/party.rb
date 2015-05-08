class Party < ActiveRecord::Base
  has_many :rsvps
  has_many :users, through: :rsvps

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

  def rsvp_status(user)
    rsvp = Rsvp.find_by(party_id: self.id, user_id: user.id)
    rsvp.status
  end

end
