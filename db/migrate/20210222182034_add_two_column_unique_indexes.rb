class AddTwoColumnUniqueIndexes < ActiveRecord::Migration[6.1]
  def change
    add_index :skills, [:name, :game_set_id], unique: true
    add_index :picks, [:name, :game_set_id], unique: true
    add_index :occupations, [:name, :game_set_id], unique: true
  end
end
