class User < ActiveRecord::Base
  belongs_to :address
  belongs_to :group
  belongs_to :department
  belongs_to :postiton
end
