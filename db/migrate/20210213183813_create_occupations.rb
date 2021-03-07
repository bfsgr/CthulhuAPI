class CreateOccupations < ActiveRecord::Migration[6.0]
  def change
    create_table :occupations do |t|
      t.string :name
      t.integer :min_credit
      t.integer :max_credit
      t.string :calcType
      t.timestamps
    end
  end
end
