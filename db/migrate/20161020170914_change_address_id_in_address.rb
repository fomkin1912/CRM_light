class ChangeAddressIdInAddress < ActiveRecord::Migration
  def change
  	change_column :addresses, :addressable_id, :integer
  	change_column :addresses, :addressable_type, :string
  end
end
