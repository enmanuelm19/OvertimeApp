require 'rails_helper'

RSpec.describe User, type: :model do
    before do
        @user = FactoryGirl.create(:user)
    end
    describe 'creation' do
        it 'can be created' do
            expect(@user).to be_valid
        end
    end

    describe 'validations' do
        it 'cannot be created without first_name' do
            @user.first_name = nil
            expect(@user).to_not be_valid
        end
        it 'cannot be created without last_name' do
            @user.last_name = nil
            expect(@user).to_not be_valid
        end
        it 'cannot be created without phone' do
            @user.phone = nil
            expect(@user).to_not be_valid
        end
        it "requires the phone attr to only contain integers" do
          @user.phone = 'mygreatest'
          expect(@user).to_not be_valid
        end
        it "requires the phone to only have 10 characters" do
          @user.phone = "123456789012"
          expect(@user).to_not be_valid 
        end
    end
    describe 'custom name method' do
        it 'has a full name method that combine first and last name' do
            expect(@user.full_name).to eq('Snow, John')
        end
    end
end
