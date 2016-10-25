class ServeActivitiesController < ActivitiesController

	def self.all_scoped(page_state)
		activities = Activity.all
		if page_state
			activities.completed
		else
		  activities.planned	
		end
	end

	def planned
		@activities = Activity.my(current_user).planned
		session[:activities_page_state][:completed] = false
	end

	def completed
		@activities = Activity.my(current_user).completed
		session[:activities_page_state][:completed] = true
	end
	
end