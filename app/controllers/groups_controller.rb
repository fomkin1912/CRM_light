class GroupsController < ApplicationController

def index
  @groups = Group.all
end

def new
  @group = Group.new
end

def create
  @group = Group.new(group_params)
  
  if @group.save
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

  if @group.update(group_params)
    redirect_to groups_path, notice: 'Group updated.'
  else
    render 'edit'
  end

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
  params.require(:group).permit(:name)
end

end  
