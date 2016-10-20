class Company < ActiveRecord::Base
	belongs_to :company_type
	has_many :contacts
  has_many :address, as: :addressable, dependent: :destroy 

	validates :title, :company_type_id, presence: true
	validates_uniqueness_of :title

end