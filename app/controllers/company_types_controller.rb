class CompanyTypesController < ApplicationController

	def index
	  @company_types = CompanyType.all
  end

	def new
		@company_type = CompanyType.new()
	end

	def create
	  @company_type = CompanyType.new(company_type_params)
    
    if @company_type.save 
      redirect_to company_types_path, notice: "Company type \'#{ @company_type.title }\' created."
    else
      render "new"
    end

  end

  def edit
  	@company_type = CompanyType.find(params[:id])
  end

  def update
    @company_type = CompanyType.find(params[:id])

    if @company_type.update(company_type_params) 
      redirect_to company_types_path, notice: "Company type \'#{ @company_type.title }\' updated."
    else
      render "edit"
    end

  end

  def destroy
  	CompanyType.find(params[:id]).destroy
    redirect_to company_types_path, notice: "Company type deleted."
  end
  
  private

  def company_type_params
    params.require(:company_type).permit([:title])
  end

end
