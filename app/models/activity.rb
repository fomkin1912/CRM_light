class Activity < ActiveRecord::Base
  include Filterable
  
  belongs_to :user
  belongs_to :contact
  belongs_to :activity_type

  validates :activity_type, :user, :contact, :subject, presence: true

  scope :my, -> (user) { where("user_id = ?", user.id) }
  scope :select_by_contact, -> (contact_id) { where("contact_id = ?", contact_id) }
  scope :completed, -> (true_or_false) { 
    if true_or_false == "false"
      where("date_planned > ?", Date.today)
    else
      where("date NOT NULL")
    end
   }
  #scope :select_all, -> (selector) { where(nil) }  
  
end
