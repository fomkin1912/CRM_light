require 'rails_helper'

RSpec.describe Activity, type: :model do
  
  describe "validations" do
    
    let(:invalid_activity) { build(:activity, activity_type_id: nil, user_id: nil, contact_id: nil, subject: "")}
    let(:activity)  { build(:activity) } 

  	it "valid with activity_type_id, user_id, contact_id, subject" do
   		expect(activity).to be_valid
    end
    it "invalid without activity_type_id, user_id, contact_id, subject" do
    	invalid_activity.valid?
    	expect(invalid_activity.errors.count).to eq(4)
    end
  end

  before(:context) do
      @first_user = create(:user, name: "First user")
      @second_user = create(:user, name: "Second user")
      @first_contact = create(:contact)
      @second_contact = create(:contact)
      @activity = create(:activity, user: @first_user, contact: @first_contact)
    end
  
  describe "scopes" do
   

    it ":my scope" do
      expect(Activity.my(@first_user)).to include(@activity)
      expect(Activity.my(@second_user)).not_to include(@activity)
    end
    it "completed: false (planned)" do
      @activity.update(date_planned: Date.today + 100)
      expect(Activity.completed("false")).to include(@activity)
      @activity.update(date_planned: Date.today - 100)
      expect(Activity.completed("false")).not_to include(@activity)
    end
    it "completed: true" do
      @activity.update(date: Date.today - 100)
      expect(Activity.completed("true")).to include(@activity)
      @activity.update(date: nil)
      expect(Activity.completed("true")).not_to include(@activity)
    end
    it ":select_by_contact scope" do
      expect(Activity.select_by_contact(@first_contact.id)).to include(@activity)
      expect(Activity.select_by_contact(@second_contact.id)).not_to include(@activity) 
    end
  end
  describe ":filter method (combined scopes)" do
    before(:example) do
      @user_with_activities = create(:user_with_activities, contact: @first_contact)
    end

    it "has 2 planned activities" do
      search = { completed: "false", select_by_contact: "" }
      expect(@user_with_activities.activities.filter(search).length).to eq(2)
    end
    it "has 3 completed activities" do
      search = { completed: "true", select_by_contact: "" }
      expect(@user_with_activities.activities.filter(search).length).to eq(3)
    end
    it "has 5 overall activities" do
      search = { select_by_contact: "" }
      expect(@user_with_activities.activities.filter(search).length).to eq(5)
    end
    it "has 2 planned activities with user" do
      contact_id = @user_with_activities.activities.first.contact_id
      search = { select_by_contact: contact_id.to_s, completed: "false" }
      expect(@user_with_activities.activities.filter(search).length).to eq(2)
    end   
    it "has 3 completed activities with user" do
      contact_id = @user_with_activities.activities.first.contact_id
      search = { select_by_contact: contact_id.to_s, completed: "true" }
      expect(@user_with_activities.activities.filter(search).length).to eq(3)
    end   
    it "has no planned or completed activities with invalid contact" do
      contact_id = @user_with_activities.activities.first.contact_id + 1
      search = { select_by_contact: contact_id.to_s, completed: "true" }
      expect(@user_with_activities.activities.filter(search).length).to eq(0)
      search = { select_by_contact: contact_id.to_s, completed: "false" }
      expect(@user_with_activities.activities.filter(search).length).to eq(0)
    end   

  end
end