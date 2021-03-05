class LinkUserAndGameSet < ActiveRecord::Migration[6.0]
	def change
		change_table(:game_sets) do |t|
			t.belongs_to :user
		end
	end
end
