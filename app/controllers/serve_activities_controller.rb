class ServeActivitiesController < ApplicationController

	def planned
		@activities = Activity.my(current_user).planned
	end

	def completed
		@activities = Activity.my(current_user).completed
	end

end