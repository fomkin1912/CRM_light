class Group < ActiveRecord::Base

  has_many :group_users
  has_many :users, through: :group_users
  belongs_to :owner, foreign_key: :created_by, class_name: "User"

  validates :name, presence: true, uniqueness: true

  def update_users(user_ids)
  	self.users = User.where(id: user_ids)
  	self.save
  end
   	
end
