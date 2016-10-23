class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  DefaultSortColumns = { "Group" => ["name"], "Company" => ["title"], "CompanyType" => ["title"],
   "Contact" => ["last_name", "first_name", "mid_name"], "User" => ["last_name", "name", "mid_name"],
   "ActivityType" => ["title"], "Activity" => ["created_at"]}

  helper_method :sort_column, :sort_direction

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user|
      user.permit(:name, :email, :password, :password_confirmation, :mid_name, :last_name, :address_attributes => [:street])
    end

    devise_parameter_sanitizer.permit(:account_update) do |user|
      user.permit(:password, :password_confirmation, :current_password, :mid_name, :last_name, :position_id, :department_id, :address_attributes => [:street])
    end
  end
  
  private

  def sort_column
    model_class = controller_name.classify.constantize
    params[:sort] && params[:sort].all? { |elt| model_class.column_names.include?(elt) } ?
     params[:sort] : DefaultSortColumns[model_class.name]
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def sort_clause
    sort_column.map { |x| x + " " + sort_direction }.reduce {|sum, y| sum + ", " + y}
  end

end
