class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.date :birthday
      t.integer :gender
      t.string :status
      t.integer :viewed_count
      t.integer :location_id
      t.integer :isdelete

      t.timestamps
    end
  end
end
