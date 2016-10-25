require 'rails_helper'

RSpec.describe Activity, type: :model do
  
  context "validations" do
    
    let(:invalid_activity) { FactoryGirl.build(:activity, activity_type_id: nil, user_id: nil, contact_id: nil, subject: "")}
    let(:activity)  { FactoryGirl.build(:activity) } 

  	it "valid with activity_type_id, user_id, contact_id, subject" do
   		expect(activity).to be_valid
    end
    it "invalid without activity_type_id, user_id, contact_id, subject" do
    	invalid_activity.valid?
    	expect(invalid_activity.errors.count).to eq(4)
    end
  end

  context "scopes" do
    first_user = FactoryGirl.create(:user, name: "First user")
    second_user = FactoryGirl.create(:user, name: "Second user")
    activity = FactoryGirl.create(:activity, user: first_user)

    it ":my scope" do
      expect(Activity.my(first_user)).to include(activity)
      expect(Activity.my(second_user)).not_to include(activity)
    end
   it ":date_planned scope" do
      activity.update(date_planned: Date.today + 100)
      expect(Activity.planned).to include(activity)
      activity.update(date_planned: Date.today - 100)
      expect(Activity.planned).not_to include(activity)
    end
   it ":completed scope" do
      activity.update(date: Date.today - 100)
      expect(Activity.completed).to include(activity)

      activity.update(date: nil)
      expect(Activity.completed).not_to include(activity)
    end
  end

end