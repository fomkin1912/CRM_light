class ActivitiesController < ApplicationController

	before_action :set_page_state, only: [:index]

	def index
		@activities = ServeActivitiesController.all_scoped(session[:activities_page_state]).my(current_user)
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

	def set_page_state
	  session[:activities_page_state] ||= { "completed" => false, "contact_id" => nil }
	  session[:activities_page_state]["contact_id"] = params[:activity]["contact_id"] if params[:activity] && params[:activity]["contact_id"]
	end

end