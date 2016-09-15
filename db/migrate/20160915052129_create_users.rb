class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name,      null:false, default:""
      t.string :last_name, null:false, default:""
      t.string :mid_name,  null:false
      t.string :email,     null:false
      t.string :phone,     limit:32
      t.string :mobile,    limit:32
      t.string :skype,     limit:64
      t.string :password_digest
      t.boolean :enabled,  default:false
      t.boolean :admin,    default:false
      t.references :address, index: true, foreign_key: true
      t.references :group, index: true, foreign_key: true
      t.references :department, index: true, foreign_key: true
      t.references :postiton, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
