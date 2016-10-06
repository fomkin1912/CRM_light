require 'rails_helper'

RSpec.describe User, type: :model do

  describe "Validations and uniq test" do

    it "valid with name, last_name, email, admin, enabled" do
      expect(FactoryGirl.build(:user)).to be_valid
    end

    it "invalid without name" do
      user = FactoryGirl.build(:user, name: "")
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end

    it "valid without last_name" do
      user = FactoryGirl.build(:user, last_name: "")
      expect(user).to be_valid
    end 

    it "invalid without email" do
    	user = FactoryGirl.build(:user, email: "")
    	user.valid?
    	expect(user.errors[:email]).to include("can't be blank")
    end

    it "invalid without mid_name" do
      user = FactoryGirl.build(:user, mid_name: nil)
      expect(user).to be_valid
    end 
    
    it "invalid without enabled" do
      user = FactoryGirl.build(:user, enabled: nil)
      user.valid?
      expect(user.errors[:enabled]).to include("is not included in the list")
    end

    it "invalid without admin" do
      user = FactoryGirl.build(:user, admin: nil)
      user.valid?
      expect(user.errors[:admin]).to include("is not included in the list")
    end

    it "have unique email" do
    	user = FactoryGirl.create(:user, email: "johndoe@example.com")
      other_user = FactoryGirl.build(:user,
    		                             email: "johndoe@example.com")
    	other_user.valid?
      expect(other_user.errors[:email]).to include("has already been taken")   
    end
  end

  describe "Instance methods test" do

    context "user.full_name method" do

      it "have full_name with all attributes" do
        user = FactoryGirl.create(:user, name: "One", mid_name: "Two", last_name: "Three")
        expect(user.full_name).to eq "One Two Three"
      end

      it "have right name without mid_name" do
        user = FactoryGirl.create(:user, name: "One", mid_name: "", last_name: "Three")
        expect(user.full_name).to eq "One Three"
      end
      
      it "have right name without last_name" do
        user = FactoryGirl.create(:user, name: "One", mid_name: "Two", last_name: "")
        expect(user.full_name).to eq "One Two"
      end

      it "have right name without mid_name and last_name" do
        user = FactoryGirl.create(:user, name: "One", mid_name: "", last_name: "")
        expect(user.full_name).to eq "One"
      end
    end

    context "Init method" do
      it "trigger :init after initialize callback" do
        user = User.create(name: "John", email: "j@J", password: "password")
        expect(user.address_id).to be_a(Integer)
      end
    end
      
  end
end
