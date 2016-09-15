class User < ActiveRecord::Base
  belongs_to :address
  belongs_to :group
  belongs_to :department
  belongs_to :postiton

  validates :name, :last_name, :mid_name, :email, :group_id, presence: true
  validates :email, uniqueness: true
  validates :enabled, :admin, inclusion: {in: [true, false]}

end
