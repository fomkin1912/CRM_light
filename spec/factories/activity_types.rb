FactoryGirl.define do
  factory :activity_type do
    sequence(:title) { |n| "This is activity number #{n}" }
  end
end
