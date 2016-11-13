class Contact < ActiveRecord::Base
  has_many :addresses, as: :addressable, dependent: :destroy
  has_many :activities
  belongs_to :company
  belongs_to :user
  belongs_to :assignee, foreign_key: "assigned_to", class_name: "User"

  validates :first_name, :user_id, :access, presence:true
  validate :full_name_must_be_unique


  def full_name
    [last_name, first_name, mid_name].reject { |n| n.blank? }.join(' ')
  end

  def name
    return first_name if last_name.empty? && mid_name.empty?
  	last_name + ' ' + [first_name, mid_name].reject { |n| n.blank? }.map { |n| n[0].upcase + '.' }.join(' ')
	
  end

  private

  def full_name_must_be_unique
    contact = Contact.where(["first_name = ? and mid_name =  ? and last_name = ? and id <> ?", first_name, mid_name, last_name, id])
    errors.add(:full_name, "Full_name must be unique") if contact.present?
  end
end
