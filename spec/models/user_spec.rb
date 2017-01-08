require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.create(email: "test@test.com", password: "12341234", password_confirmation: "12341234", first_name: "john", last_name: "snow")
  end
  describe "creation" do
    it "can be created" do
      expect(@user).to be_valid
    end
    it "cannot be created" do
      @user.first_name = nil
      @user.last_name = nil
      expect(@user).to_not be_valid
    end
  end

  describe "custom name method" do
    it "has a full name method that combine first and last name" do
      expect(@user.full_name).to eq("Snow, John") 
    end
  end
end
