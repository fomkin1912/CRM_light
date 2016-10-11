class ChangeContact < ActiveRecord::Migration
  def change
  	change_column_null(:contacts, :company_id, true)
  end
end
