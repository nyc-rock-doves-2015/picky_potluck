class User < ActiveRecord::Base
  has_many :nono_users
  has_many :nonos, through: :nono_users
  has_many :rsvps
  has_many :parties, through: :rsvps

  has_secure_password

  validates :email, uniqueness: true, presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates :name, presence: true
  validates :password, length: { minimum: 6 }, :if => :password
  validates :password_confirmation, presence: true, :if => :password_confirmation

  before_save :capitalize_fave

  def on_guest_list?(party)
    guest_list = party.users
    guest_list.include?(self)
  end

  def upcoming_parties
    self.parties.where("date > ?", Time.now).order('date asc')
  end

  def past_parties
    self.parties.where("date < ?", Time.now).order('date asc')
  end

  def capitalize_fave
    self.fave = fave.split.map(&:capitalize).join(' ') if fave
  end
end
