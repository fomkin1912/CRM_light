class ActivitiesController < ApplicationController
	include Stateful

	before_action :set_page_state, only: [:index]

	def index
	  @activities = Activity.my(current_user).filter(filtered_params)
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
	  params.require(:activity).permit(:user_id, :activity_type_id, :user_id, :contact_id, :subject, :info, :date_planned, :date, :sort)
	end

	def filtered_params
# 		params.merge!(completed: "false") unless params[:completed]
#	  params.merge!(select_by_contact: "") unless params[:select_by_contact]
	  params.slice(:select_by_contact, :completed)
	end

	def set_page_state
		page = "#{controller_name}_#{params[:action]}"
		page_defaults = Stateful::PAGE_DEFAULTS[page]
		if !session.include?(page)
			session.merge!(page => {})
			page_defaults.each { |key, value| session[page].merge!(key => value) }
    end
    if page_defaults.any? { |key, value| !params.include?(key) }
    	page_defaults.each_key { |key| params.merge!(key => session[page][key]) }
    	return
    end
		page_defaults.each_key { |key| session[page][key] = params[key] if session[page][key] != params[key] }
	end
end