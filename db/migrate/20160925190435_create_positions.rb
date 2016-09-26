class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string :title

      t.timestamps null: false
    end

    add_index :positions, :title, unique: true

  end
end
