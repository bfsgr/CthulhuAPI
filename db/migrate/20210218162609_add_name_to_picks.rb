class AddNameToPicks < ActiveRecord::Migration[6.1]
	def change
		change_table(:picks) do |t|
			t.string :name
		end
	end
end
