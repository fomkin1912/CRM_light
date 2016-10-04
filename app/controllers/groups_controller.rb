class GroupsController < ApplicationController

  respond_to :html, :js

  def index
    @groups = Group.all
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

    def select_users
      @group = Group.find(params[:id])
    end

    def add_users
      @group = Group.find(params[:id])
    # Add new users
      new_users = params[:group][:user_ids]
      old_users = @group.users.map {|x| x.id.to_s } + [""]
      add_users = new_users.reject { |item| old_users.include?(item) }
      
      add_users.each do |id|
        @group.users << User.find(id)
      end
    
    # Delete unwanted users
      delete_users = old_users.reject { |item| new_users.include?(item) }
      @group.group_users.where(user_id: delete_users).destroy_all
      
      redirect_to groups_path, notice: 'Users were added.'
      
    end

  private

  def group_params
    params.require(:group).permit(:name, :created_by, user_ids: [])
  end

end  
