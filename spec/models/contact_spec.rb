require 'rails_helper'

RSpec.describe Contact, type: :model do
  
  describe "validations" do
  	it "valid with first name, company_id and user_id" do
  	  expect(Contact.new(first_name: "Ivan", user_id: 1)).to be_valid
  	end
  	it "invalid without 'user_id'" do
  	  contact = FactoryGirl.build(:contact, user_id:  nil)
  	  contact.valid?	
  	  expect(contact.errors[:user_id]).to include("can't be blank")
  	end
    it "invalid without first_name" do
  	  contact = FactoryGirl.build(:contact, first_name:  "   ")
  	  contact.valid?	
  	  expect(contact.errors[:first_name]).to include("can't be blank")
  	end
  	it "invalid with full_name duplicated" do
      user_one = FactoryGirl.create(:contact)
      user_two = FactoryGirl.build(:contact)
      user_two.valid?

  	  expect(user_two.errors[:full_name]).to include("Full_name must be unique")
  	end  	
  end

  describe "associations" do
  	it "has many addresses" do
  	  expect(Contact.reflect_on_association(:addresses).macro).to eq(:has_many)
  	end	
  	it "belongs to User a who creates it" do
  	  expect(Contact.reflect_on_association(:user).macro).to eq(:belongs_to)
  	end
  	it "belongs to Assignee" do
  	  expect(Contact.reflect_on_association(:assignee).macro).to eq(:belongs_to)
  	end
    it "belongs to Company" do
      expect(Contact.reflect_on_association(:company).macro).to eq(:belongs_to)
    end 
  end

  describe "instanse methods" do
  	   contact_with_full_name = Contact.create(first_name: "Ivan", mid_name: "Sergeevich", last_name: "Pupkin")
  	   contact_with_last_name = Contact.create(first_name: "Ivan", mid_name: "", last_name: "Pupkin")
  	   contact_with_first_name = Contact.create(first_name: "Ivan", mid_name: "", last_name: "")
  	   contact_with_nil_first_name = Contact.create(first_name: "")
       contact_with_blank_first_name = Contact.create(first_name: "   ")
  	  
    context "name" do
      it "respond to full name is present" do
        expect(contact_with_full_name.name).to eq "Pupkin I. S."
      end
      it "respond to first and last name is present" do
        expect(contact_with_last_name.name).to eq "Pupkin I."
      end
      it "respond to first name only" do
        expect(contact_with_first_name.name).to eq "Ivan"
      end
      it "respond with nil if first name is nil" do
      	expect(contact_with_nil_first_name.name).to eq nil
      end
      it "respond with nil if first name is blank" do
      	expect(contact_with_blank_first_name.name).to eq nil
      end
    end

    context "full_name" do
      it "respond to full name is present" do
        expect(contact_with_full_name.full_name).to eq "Pupkin Ivan Sergeevich"
      end
      it "respond to first and last name is present" do
        expect(contact_with_last_name.full_name).to eq "Pupkin Ivan"
      end
      it "respond to first name only" do
        expect(contact_with_first_name.full_name).to eq "Ivan"
      end
      it "respond with nil if first name is nil" do
      	expect(contact_with_nil_first_name.full_name).to eq nil
      end
      it "respond with nil if first name is blank" do
      	expect(contact_with_blank_first_name.full_name).to eq nil
      end
    end  
  end
end
