class NonoUser < ActiveRecord::Base
  belongs_to :nono
  belongs_to :user

  validates :nono_id, presence: true
  validates :user_id, presence: true
end
