class ServeActivitiesController < ActivitiesController

	before_action :set_activities_scope, only: [:by_contact_id, :new]

	def self.all_scoped(page_state)
		  @activities = Activity.all
	  	@activities = @activities.by_contact_id(page_state["contact_id"]) if page_state["contact_id"].present?
	  	return @activities = @activities.planned if page_state["completed"] == false 
	  	@activities.completed

	end

	def planned
		session[:activities_page_state]["completed"] = false
		set_activities_scope
	end

	def completed
		session[:activities_page_state]["completed"] = true
		set_activities_scope
	end

	private
	  def set_activities_scope
	  	state_contact_id = session[:activities_page_state]["contact_id"]
	  	state_completed = session[:activities_page_state]["completed"]
	  	@activities = Activity.my(current_user)
	  	@activities = @activities.by_contact_id(state_contact_id) if state_contact_id.present?
	  	return @activities = @activities.planned if state_completed == false 
	  	@activities = @activities.completed
	  end

  def set_page_state
	  session[:activities_page_state] ||= { "completed" => false, "contact_id" => nil }
	  session[:activities_page_state]["contact_id"] = params[:activity]["contact_id"] if params[:activity] && params[:activity]["contact_id"]
	end

end