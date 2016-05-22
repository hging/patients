class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :medical_record_number
      t.date :date_of_birth
      t.integer :gender
      t.integer :status
      t.references :location, index: true, foreign_key: true
      t.integer :viewed_count

      t.timestamps null: false
    end
  end
end
