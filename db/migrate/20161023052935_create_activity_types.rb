class CreateActivityTypes < ActiveRecord::Migration
  def change
    create_table :activity_types do |t|
      t.string :title, index: true, uniqueness: true

      t.timestamps null: false
    end
  end
end
