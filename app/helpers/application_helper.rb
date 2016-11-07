module ApplicationHelper

	def sortable(column, title = nil, optional_columns = {})
    title ||= column.titleize
    column = [column]
   	column += optional_columns["columns"] if optional_columns.any?
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
  	link_to title, params.merge(:sort => column, :direction => direction)
	end

end
