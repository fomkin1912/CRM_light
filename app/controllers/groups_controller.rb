class GroupsController < ApplicationController

helper_method :sort_column, :sort_direction

  def index
    @groups = Group.order(sort_column + " " + sort_direction)
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      @group.users << current_user
      redirect_to groups_path, notice: 'New group created.'
    else
      render 'new'
    end
  end    

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])

    if params.include?(:ids)
      if @group.update_users  
        flash[:notice] = 'Users in group updated.'
      else
        flash[:alert] = 'Users in group were not updated.'     
      end
        
    else
      if @group.update(group_params)
        flash[:notice] = 'Group updated.'
      else
        render 'edit'
      end
    end

    redirect_to groups_path

  end

  def destroy
    @group = Group.find(params[:id])
      
      if !@group.users.empty? 
        flash[:alert] = 'Can\'t destroy group. Associated records in users are found.'
      else
        if @group.destroy
          flash[:notice] = 'Group destroyed.'
        else
          flash[:alert] = 'Something went wrong.'
        end
      end
      redirect_to groups_path
  end

  private

  def group_params
    params.require(:group).permit(:name, :created_by, user_ids: [])
  end

  def sort_column
    Group.column_names.include?(params[:sort]) ? params[:sort] : "name" 
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end  
