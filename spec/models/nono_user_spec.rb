require 'rails_helper'

describe NonoUser do
  it "is valid with a user_id and nono_id" do
    nono_user = NonoUser.new(user_id: Faker::Address.building_number, nono_id: Faker::Address.building_number)
    expect(nono_user).to be_valid
  end
  it "is invalid without a user_id" do
    nono_user = NonoUser.new(user_id: nil)
    nono_user.valid?
    expect(nono_user.errors[:user_id]).to include("can't be blank")
  end
  it "is invalid without a nono-id" do
    nono_user = NonoUser.new(nono_id: nil)
    nono_user.valid?
    expect(nono_user.errors[:nono_id]).to include("can't be blank")
  end
end