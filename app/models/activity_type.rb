class ActivityType < ActiveRecord::Base
	has_many :activities
	validates_presence_of :title
	validates_uniqueness_of :title

end
