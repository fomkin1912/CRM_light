# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name 'Foo'
    last_name 'Bar'
    mid_name 'FooBar'
    sequence(:email) {|n| 'johndoe#{n}@example.com'} 
    phone '123-45-67'
    mobile '890-12-34'
    skype 'myskype'
    enabled false
    admin false
    department nil
    position nil
    password 'password'

  end
end
