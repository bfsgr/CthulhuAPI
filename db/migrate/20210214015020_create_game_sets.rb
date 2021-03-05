class CreateGameSets < ActiveRecord::Migration[6.0]
	def change
		create_table :game_sets do |t|
			t.string :name

			t.timestamps
		end

		change_table(:picks) do |t|
			t.belongs_to :game_set
		end

		change_table(:skills) do |t|
			t.belongs_to :game_set
		end

		change_table(:occupations) do |t|
			t.belongs_to :game_set
		end
	end
end
