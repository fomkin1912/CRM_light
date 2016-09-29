class Admin::PositionsController < ApplicationController

def index
  @positions = Position.all
end

def new
  @position = Position.new
end

def create
  @position = Position.new(position_params)
  
  if @position.save
    redirect_to positions_path, notice: 'New position created.'
  else
    render 'new'
  end
end    

def edit
  @position = Position.find(params[:id])
end

def update
  @position = Position.find(params[:id])

  if @position.update(position_params)
    redirect_to positions_path, notice: 'Position updated.'
  else
    render 'edit'
  end

end

def destroy
  @position = Position.find(params[:id])
    
    if !@position.users.empty? 
      flash[:alert] = 'Can\'t destroy position. Associated records in users are found.'
    else
      if @position.destroy
        flash[:notice] = 'Position destroyed.'
      else
        flash[:alert] = 'Something went wrong.'
      end
    end
    
    redirect_to positions_path

end

private

def position_params
  params.require(:position).permit(:title)
end

end  
