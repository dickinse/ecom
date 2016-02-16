require "rails_helper"

describe User, :type => :model do
  it "orders by last name" do
     lindeman = FactoryGirl.create(:user, last_name: "lindeman")
     chelimsky = FactoryGirl.create(:user, last_name: "chelimsky")

    expect(User.all.order("last_name")).to eq([chelimsky, lindeman])
  end

  it "should not valid users without an email address" do
    @user = FactoryGirl.build(:user, email: "not_valid")
    expect(@user).to_not be_valid
  end
end
