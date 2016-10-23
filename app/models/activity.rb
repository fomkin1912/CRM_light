class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :contact
  belongs_to :activity_type

  validates :activity_type, :user, :contact, :subject, presence: true
end
