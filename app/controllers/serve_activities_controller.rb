class ServeActivitiesController < ActivitiesController

	def self.all_scoped(serve_params)
		@@page_state = serve_params unless serve_params 

		activities = Activity.all
		if @@page_state[:completed]
			activities.completed
		else
		  activities.planned	
		end
	end

	def planned
		@activities = Activity.my(current_user).planned
		@@page_state = { completed: false}
	end

	def completed
		@activities = Activity.my(current_user).completed
		@@page_state = { completed: true}
	end
	
end