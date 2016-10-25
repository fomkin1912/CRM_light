class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :contact
  belongs_to :activity_type

  validates :activity_type, :user, :contact, :subject, presence: true

  scope :my, -> (user) { where("user_id = ?", user.id) }
  scope :planned, -> { where("date_planned > ?", Date.today) }
  scope :completed, -> { where("date NOT NULL") }
  
end
