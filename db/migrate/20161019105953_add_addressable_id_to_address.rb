class AddAddressableIdToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :addressable_id, :string, index: true
    add_column :addresses, :addressable_type, :integer
    remove_column :addresses, :user_id

  end
end
