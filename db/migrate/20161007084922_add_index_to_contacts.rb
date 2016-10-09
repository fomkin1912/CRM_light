class AddIndexToContacts < ActiveRecord::Migration
  def change
  	add_index(:contacts, :first_name)
  	add_index(:contacts, :mid_name)
  	add_index(:contacts, :last_name)
    add_index(:contacts, [:first_name, :mid_name, :last_name], unique: true) 
  end
end
