# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name        { generate(:first_name) }
    last_name   { generate(:last_name) }
    mid_name    { generate(:mid_name) }
    email
    phone '123-45-67'
    mobile '890-12-34'
    skype 'myskype'
    enabled false
    admin false
    department nil
    position nil
    password 'password'
    
    factory :user_with_activities do
      ignore do
        contact nil
        date_planned { generate(:future_date) }
        date { generate(:past_date) }
      end

      after(:create) do |user, eval|
        create_list(:activity, 2, user: user, contact: eval.contact, date_planned: eval.date_planned)
        create_list(:activity, 3, user: user, contact: eval.contact, date: eval.date)
      end
    end

    factory :user_with_different_contact_activities do
      ignore do
        contact
        date_planned { generate(:future_date) }
        date { generate(:past_date) }
      end

      after(:create) do |user, eval|
        create_list(:activity, 2, user: user, contact: eval.contact, date_planned: eval.date_planned)
        create_list(:activity, 3, user: user, contact: eval.contact, date: eval.date)
      end
    end
  end
end
