class AddCompanyToContacts < ActiveRecord::Migration
  def change
    add_reference :contacts, :company, index: true, foreign_key: true
    change_column_null(:contacts, :company_id, false)
  end
end
