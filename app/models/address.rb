class Address < ActiveRecord::Base

  belongs_to :user
  belongs_to :contact, inverse_of: :contact

end
