class NonoUser < ActiveRecord::Base
  belongs_to :nono
  belongs_to :user
end
