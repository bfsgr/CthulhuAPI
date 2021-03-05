class CreatePicks < ActiveRecord::Migration[6.0]
	def change
		create_table :picks do |t|
			t.integer :numberOfPicks
			t.boolean :pickAny

			t.timestamps
		end
	end
end
