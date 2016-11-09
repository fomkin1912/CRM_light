module ActivitiesHelper
  def included_in_params?(radio_button_name)
  	params.include?(radio_button_name) && params[radio_button_name] == "true"
  end
end
