class ChangePositionInUser < ActiveRecord::Migration
  def change
  	rename_column :users, :postiton_id, :position_id
  end
end
