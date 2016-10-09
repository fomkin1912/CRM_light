class CreateCompanyTypes < ActiveRecord::Migration
  def change
    create_table :company_types do |t|
      t.string :title, null: false, default: ""
      t.timestamps null: false
    end

    add_index :company_types, :title, unique: true

  end
end
