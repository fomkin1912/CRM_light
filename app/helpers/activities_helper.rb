module ActivitiesHelper
  def included_in_params?(radio_button_name)
  	params.include?(radio_button_name) && params[radio_button_name] == "true"
  end

  def select_by_contact_id_disabled?(select_tag_name)
  	return "disabled" if params[select_tag_name].blank?
  	nil
  end

 
end
