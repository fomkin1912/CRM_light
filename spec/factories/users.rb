# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "MyString"
    last_name "MyString"
    mid_name "MyString"
    email "MyString"
    phone "MyString"
    mobile "MyString"
    skype "MyString"
    password_digest "MyString"
    enabled false
    admin false
    address nil
    group nil
    department nil
    postiton nil
  end
end
