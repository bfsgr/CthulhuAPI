class CreateOccupations < ActiveRecord::Migration[6.0]
  def change
    create_table :occupations do |t|
      t.string :name
      t.integer :creditLevel, array: true, default: []
      t.string :calcType
      t.timestamps
    end
  end
end
