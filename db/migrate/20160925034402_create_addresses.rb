class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street, limit: 64
      t.string :city, limit: 32
      t.string :state, limit: 32
      t.string :zipcode, limit: 16
      t.string :country, limit: 32
      
      t.timestamps null: false
    end
  end
end
