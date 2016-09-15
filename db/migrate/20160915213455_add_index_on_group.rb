class AddIndexOnGroup < ActiveRecord::Migration
  def change
  	change_column_null(:groups, :name, false)
  	change_column_default(:groups, :name, "")
  	add_index(:groups, :name, unique: true)
  end
end
