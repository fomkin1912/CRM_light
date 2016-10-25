class ActivitiesController < ApplicationController

	def index
		@@page_state = { completed: false } if new_request?
	  @activities = ServeActivitiesController.all_scoped(serve_params).my(current_user)
	end

	def new
 	  @activity = Activity.new
	end

	def create
 	  @activity = Activity.new(activity_params)
    if @activity.save
      redirect_to activities_path, notice: "Activity for \'#{@activity.user.name}\' created."
    else
      render "new"
    end
	end

	def edit
	  @activity = Activity.find(params[:id])
	end

	def update
	  @activity = Activity.find(params[:id])
	  @activity.update(activity_params)
	  if @activity.save
      redirect_to activities_path, notice: "Activity for \'#{@activity.user.name}\' changed."
    else
      render "edit"
    end
	end

	def destroy
	  Activity.destroy(params[:id])
	  redirect_to activities_path, notice: "Activity destroyed."
	end

	private

	def activity_params
	  params.require(:activity).permit(:user_id, :activity_type_id, :user_id, :contact_id, :subject, :info, :date_planned, :date)
	end

	def serve_params
		params.slice(:completed)
	end

	def new_request?
	  source_controller = Rails.application.routes.recognize_path(request.referrer)[:controller]
	  source_controller != "activities" && source_controller != "serve_activities"
	end

end