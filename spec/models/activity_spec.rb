require 'rails_helper'

RSpec.describe Activity, type: :model do
  
  context "validations" do
    
    let(:invalid_activity) { Activity.new(activity_type_id: nil, user_id: nil, contact_id: nil, subject: "")}
    
  	it "valid with activity_type_id, user_id, contact_id, subject" do
      activity = Activity.new(subject: "Meeting")
      activity.user.build(id: 1)
      activity.activity_type.build(id: 2)
      activity.contact.build(id: 3)
   		expect(activity).to be_valid
    end
    it "invalid without activity_type_id, user_id, contact_id, subject" do
    	#activity = FactoryGirl.build(:activity, activity_type_id: nil, user_id: nil, contact_id: nil, subject_id: "")
    	invalid_activity.valid?
    	expect(invalid_activity.errors.count).to eq(4)
    end
  end
end
