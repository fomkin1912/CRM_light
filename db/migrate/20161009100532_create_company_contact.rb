class CreateCompanyContact < ActiveRecord::Migration
  def change
    create_table :company_contacts, id: false do |t|
      t.references :company, index: true, foreign_key: true
      t.references :contact, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
