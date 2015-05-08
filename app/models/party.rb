class Party < ActiveRecord::Base
  has_many :rsvps
  has_many :users, through: :rsvps

  def combine_nonos
    @users = self.users
    @combined_nonos = []
    @users.each do |user|
      user.nonos.each do |nono|
        @combined_nonos << nono
      end
    end
    @combined_nonos.uniq
  end

end
