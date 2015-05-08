class Party < ActiveRecord::Base
  has_many :rsvps
  has_many :users, through: :rsvps

  def combine_nonos
    @users = self.users
    @combined_nonos = []
    @users.each do |user|
      user.nonos.each do |nono|
        @combined_nonos << nono.name
      end
    end
    @combined_nonos.uniq.sort{|a, b| a <=> b}
  end

end
