class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :first_name, null:false, default:""
      t.string :last_name, null:false, default:""
      t.string :mid_name, null:false, default:""
      t.string :email
      t.string :alt_email
      t.string :phone, limit: 24
      t.string :mobile, limit: 24
      t.string :skype, limit: 32
      t.references :address, index:true, foreign_key: true
      t.string :access, limit: 12, default: "Public"
      t.references :user, index:true, foreign_key: true
      t.integer :assigned_to, index:true 


      t.timestamps null: false
    end
  end
end
