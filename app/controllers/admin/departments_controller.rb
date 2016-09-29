class Admin::DepartmentsController < ApplicationController

def index
  @departments = Department.all
end

def new
  @department = Department.new
end

def create
  @department = Department.new(department_params)
  
  if @department.save
    redirect_to departments_path, notice: 'New department created.'
  else
    render 'new'
  end
end    

def edit
  @department = Department.find(params[:id])
end

def update
  @department = Department.find(params[:id])

  if @department.update(department_params)
    redirect_to departments_path, notice: 'Department updated.'
  else
    render 'edit'
  end

end

def destroy
  @department = Department.find(params[:id])
    
    if !@department.users.empty? 
      flash[:alert] = 'Can\'t destroy dept. Associated records in users are found.'
    else
      if @department.destroy
        flash[:notice] = 'Department destroyed.'
      else
        flash[:alert] = 'Something went wrong.'
      end
    end
    
    redirect_to departments_path

end

private

def department_params
  params.require(:department).permit(:title)
end

end  
