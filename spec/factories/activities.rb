# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :activity do
    activity_type_id 3
    user_id 10
    contact_id 5
    subject "meeting with exec"
    info "meeting was success"
    date_planned "2016-10-23 16:03:19"
    date "2016-10-23 16:03:19"
    activity_type
    user
    contact
  end
end
