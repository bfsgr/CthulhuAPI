class AddTwoColumnUniqueIndexes < ActiveRecord::Migration[6.1]
  def change
    add_index :skills, %i[name game_set_id], unique: true
    add_index :picks, %i[name game_set_id], unique: true
    add_index :occupations, %i[name game_set_id], unique: true
  end
end
