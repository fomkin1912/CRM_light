FactoryGirl.define do
  sequence :email do |n|
  	"person#{n}@example.com"
  end
  sequence :first_name do |n|
  	"FirstName#{n}"
  end
  sequence :last_name do |n|
  	"LastName#{n}"
  end
  sequence :mid_name do |n|
  	"MidName#{n}"
  end
  sequence :future_date do |n|
    Date.today + (10 * n).days
  end
  sequence :past_date do |n|
  	Date.today - (10 * n).days
  end

end