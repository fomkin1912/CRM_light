class Company < ActiveRecord::Base
	belongs_to :company_type
	has_many :contacts

	validates :title, :company_type_id, presence: true
	validates_uniqueness_of :title

end