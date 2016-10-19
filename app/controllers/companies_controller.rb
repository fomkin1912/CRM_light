class CompaniesController < ApplicationController

	def index
	  @companies = Company.order(sort_clause)
  end

	def new
		@company = Company.new()
	end

	def create
	  @company = Company.new(company_params)
    
    if @company.save 
      redirect_to companies_path, notice: "Company \'#{ @company.title }\' created."
    else
      render "new"
    end

  end

  def edit
  	@company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])

    if @company.update(company_params) 
      redirect_to companies_path, notice: "Company \'#{ @company.title }\' updated."
    else
      render "edit"
    end

  end

  def destroy
  	Company.find(params[:id]).destroy
    redirect_to companies_path, notice: "Company destroyed."
  end
  
  private

  def company_params
    params.require(:company).permit([:title, :full_title, :company_type_id])
  end

end
