class ActivityTypesController < ApplicationController

	def index
	  @activity_types = ActivityType.order(sort_clause)
	end

	def new
 	  @activity_type = ActivityType.new
	end

	def create
 	  @activity_type = ActivityType.new(activity_type_params)
    if @activity_type.save
      redirect_to activity_types_path, notice: "Activity type \'#{@activity_type.title}\' created."
    else
      render "new"
    end
	end

	def edit
	  @activity_type = ActivityType.find(params[:id])
	end

	def update
	  @activity_type = ActivityType.find(params[:id])
	  @activity_type.update(activity_type_params)
	  if @activity_type.save
      redirect_to activity_types_path, notice: "Activity type \'#{@activity_type.title}\' changed."
    else
      render "edit"
    end
	end

	def destroy
	  ActivityType.destroy(params[:id])
	  redirect_to activity_types_path, notice: "Activtiy type destroyed."
	end

	private

	def activity_type_params
	  params.require(:activity_type).permit(:title)
	end

end