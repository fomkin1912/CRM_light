class DropContactCompany < ActiveRecord::Migration
  def change
    drop_table("company_contacts")
  end
end
