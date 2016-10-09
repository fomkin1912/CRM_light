class Contact < ActiveRecord::Base
  has_many :addresses, inverse_of: :addresses
  belongs_to :user, inverse_of: :user
  belongs_to :assignee, foreign_key: "assigned_to", class_name: "user", inverse_of: :user

  validates :first_name, :user_id, :access, presence:true
  
  validate :full_name_must_be_unique

  def full_name
    return [last_name, first_name, mid_name].reject { |n| n.blank? }.join(' ') unless first_name.blank?
    nil
  end

  def name
    return nil if first_name.blank?
    return first_name if last_name.empty? && mid_name.empty?
  	last_name + ' ' + [first_name, mid_name].reject { |n| n.blank? }.map { |n| n[0].upcase + '.' }.join(' ')
	
  end

  def full_name_must_be_unique
  	errors.add(:full_name, "Full_name must be unique") if Contact.find_by(first_name: first_name, mid_name: mid_name, last_name: last_name).present?
  end
 
end
