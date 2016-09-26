class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :title

      t.timestamps null: false
    end

    add_index :departments, :title, unique: true
  end
end
