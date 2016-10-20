class ChangeAddressableIdInAddress < ActiveRecord::Migration
  def change
  	change_column_null :addresses, :addressable_id, false
  	change_column_null :addresses, :addressable_type, false
  end
end
