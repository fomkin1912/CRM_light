class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :title, null: false, default: ""
      t.string :full_title
      t.references :company_type, index: true, foreign_key: true
      
      t.timestamps null: false
    end
  end
end
