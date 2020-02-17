require 'rails_helper'

RSpec.describe User, type: :model do
  
  before(:all) do
    @user = FactoryBot.build(:user)
  end

  it "is valid with valid attributes" do
    expect(@user).to be_valid
  end

  it "is not valid without an email" do
    user2 = FactoryBot.build(:user, email: nil)
    expect(user2).to_not be_valid
  end
 
  it "is not valid without a password" do 
    user2 = FactoryBot.build(:user, password: nil)
    expect(user2).to_not be_valid
  end
end