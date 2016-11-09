module PageStateful

  PAGE_DEFAULTS = { "activities_index" => {"completed" => "false", "select_by_contact" => ""} }

  private

	def set_page_state

	  page = "#{controller_name}_#{params[:action]}"
    page_defaults = PAGE_DEFAULTS[page]

    add_state_to_session(page, page_defaults) unless session.include?(page)

	  if page_defaults.all? { |key, value| !params.include?(key) }
	  	page_defaults.each_key { |key| params.merge!(key => session[page][key]) }
	  	return
	  end

	  page_defaults.each_key { |key| session[page][key] = params[key] if session[page][key] != params[key] }

	end

	def add_state_to_session(page, page_defaults)
	  raise NoMethodError, "There is no such page #{page} in 'PAGE_DEFAULT'" if !PAGE_DEFAULTS.include?(page)
		session.merge!(page => {})
		page_defaults.each { |key, value| session[page].merge!(key => value) }
	end

end