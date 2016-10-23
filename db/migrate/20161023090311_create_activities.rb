class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.references :activity_type, index: true, foreign_key: true, null: false
      t.references :user, index: true, foreign_key: true, null: false
      t.references :contact, index: true, foreign_key: true, null: false
      t.string :subject
      t.string :info
      t.datetime :date_planned
      t.datetime :date

      t.timestamps null: false
    end
  end
end
