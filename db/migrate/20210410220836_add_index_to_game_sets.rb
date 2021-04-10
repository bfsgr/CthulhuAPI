class AddIndexToGameSets < ActiveRecord::Migration[6.1]
  def change
    add_index :game_sets, %i[name user_id], unique: true
  end
end
