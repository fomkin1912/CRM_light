require 'rails_helper'

RSpec.describe Group, type: :model do
  
  describe "Validation test" do

    it "valid with name" do
    	group = Group.new(name: "New group")
    	expect(group).to be_valid
    end

    it "invalid without name" do
      group = Group.new(name: "")
      group.valid?
      expect(group.errors[:name]).to include("can't be blank")
    end

    it "have uniq name" do
      group = Group.create(name: "New group")
      other_group = Group.new(name: "New group")
      other_group.valid?
      expect(other_group.errors[:name]).to include(
      	  "has already been taken")
    end
  end

  describe "Instance method tests" do

  end  
  
end
