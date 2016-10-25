module ActivityHelper

  def set_planned_tab_class
    return "active" if session[:activities_page_state]["completed"] == false
    ""
  end

  def set_completed_tab_class
    return "active" if session[:activities_page_state]["completed"] == true
    ""
  end

  def selected_option
    return params[:activity]["contact_id"] if params[:activity].present?
    nil
  end
end